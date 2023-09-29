package com.kopo.finalproject.guest.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kopo.finalproject.guest.model.dao.GuestMapper;
import com.kopo.finalproject.guest.model.dto.EndMessageGuest;
import com.kopo.finalproject.guest.model.dto.Guest;
import com.kopo.finalproject.guest.model.dto.SocialToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;


@Service
public class GuestServiceImpl implements GuestService {

    private final GuestMapper guestMapper;
    String kakaoApiKey;

    @Autowired
    public GuestServiceImpl(GuestMapper guestMapper) {
        this.guestMapper = guestMapper;
    }

    @Override
    public List<Guest> getAllMember() {
        return null;
    }

    @Override
    public List<EndMessageGuest> getEndMessageGuest(String account_number) {
        return guestMapper.getEndMessageGuest(account_number);
    }

    @Override
    public Guest loginGuest(HashMap<String, String> loginData) {
        return guestMapper.loginGuest(loginData);
    }

    @Override
    public String getKakaoToken(String code) {

        Properties properties = new Properties();
        try (InputStream input = new FileInputStream("config.properties")) {
            properties.load(input);
            kakaoApiKey = properties.getProperty("kakao");
        } catch (IOException e) {
            e.printStackTrace();
        }

        String access_token = "";
        try {
            URL url = new URL("https://kauth.kakao.com/oauth/token");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=" + kakaoApiKey);
            sb.append("&code=" + code);
            BufferedWriter bw = null;
            try {
                bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
                bw.write(sb.toString());
            } catch (IOException e) {
                throw e;
            } finally {
                if (bw != null) bw.flush();
            }
            BufferedReader br = null;
            String line = "", result = "";
            try {
                br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                while ((line = br.readLine()) != null) {
                    result += line;
                }
            } catch (IOException e) {
                throw e;
            } finally {
                if (br != null)
                    br.close();
            }
            ObjectMapper mapper = new ObjectMapper();
            access_token = mapper.readValue(result, SocialToken.class).getAccess_token();

        } catch (IOException e) {
            e.printStackTrace();
        }
        return access_token;
    }

    @Override
    public Guest getKakaoUserInfo(String access_token) {
        Guest member = new Guest();
        try {
            URL url = new URL("https://kapi.kakao.com/v2/user/me");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Authorization", "Bearer " + access_token);

            try (InputStream is = conn.getInputStream(); JsonReader jsonReader = Json.createReader(is)) {
                JsonObject jsonObject = jsonReader.readObject();

                // JSON 데이터에서 원하는 값을 추출
                String id = String.valueOf(jsonObject.getJsonNumber("id").longValue());
                String connectedAt = jsonObject.getString("connected_at");
                String nickname = jsonObject.getJsonObject("properties").getString("nickname");
                String email = jsonObject.getJsonObject("kakao_account").getString("email");

                member.setReg_date(connectedAt);
                member.setName(nickname);
                member.setGuest_id(id);
                member.setEmail(email);
            }
        } catch (IOException e) {
            e.printStackTrace();
            // 예외 처리 추가 필요
        }
        return member;
    }


    @Override
    public Guest selectEmailOneMember(String email) {
        return guestMapper.selectEmailOneMember(email);
    }
}
