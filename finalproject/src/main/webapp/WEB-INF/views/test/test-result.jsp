<link rel="stylesheet" href="/resources/css/test.css">
<style>
    .progressbar::after {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        height: 20px;
        width: 0;
        background: #b6aa94;
        animation: progress 1s ease forwards;
    }

    @keyframes progress {
        0% {
            width: 75%;
        }
        100% {
            width: 100%; /* 25%의 너비를 지정 */
        }
    }

    .top1 {
        display: block;
    }

    .top2, .middle, .end {
        display: none;
    }

    .contents div {
        text-align: start;
    }
</style>


<div class="modal-c">
    <div class="top1">
        <div style="display: flex; align-items: center">
            <img src="/resources/img/left-arrow.svg" width="30px"/>
            <div class="progressbar">
                <span class="progress"></span>
            </div>
        </div>
    </div>
    <div class="top2">
        <img src="/resources/img/test-result.svg" width="710px"/>
    </div>
    <div class="middle">
        <hr>
        <div class="iQ__s6Fi4hhs t-1 ResultCardText" style="color: rgb(0, 0, 0);"><p
                style="text-align:center; line-height:2;"><span
                style="font-weight: bold; font-size: 26px; color: #b6aa94">펫보험과 적금을 섞어서 대비해봐요!</span><br>
        </p>
            <div class="contents" style="padding-left: 80px; padding-right: 80px;">
                <div style="line-height:2;">혹시 모를 일에 대비하여 상대적으로 저렴할 때 펫보험을 가입해 대비하고 적금도 동시에 준비해 안전성을 챙기는 것을 추천드립니다.
                </div>
                <br/>
                <div style="line-height:2;">반려견이 사고나 예기치 못한 수술을 진행할 시 입원, 수술등의 비용으로 생활에 큰 부담이 될 수 있기 때문에 우리 아이가 아플 때 비용
                    때문에 치료를 망설이지 않도록 미리 대비해보세요!
                </div>
                <br/>
                <div style="line-height:2;">
                    저희가 제안드린 부분은 절대적인 정답이 아니니 반려인분의 상황에 따라 잘 따져보고 결정하시길&nbsp;바랍니다.💭
                </div>
                <div style="line-height:2; text-align: center; color: #b6aa94">------<br/>
                </div>
                <div style="line-height:2; text-align: center; font-size: 26px; font-weight: bold; color: #b6aa94">
                    펫적금이란?
                </div>
                <br/>
                <div style="line-height:2;">펫적금은 반려동물을 키우는 가정들을 위한 새로운 금융상품입니다. 일반적인 적금과 비슷하지만, 이자율이 더 높은 경우 혹은 펫 관련 서비스
                    할인 혜택 등의 추가 혜택이 있습니다. 또한, 펫적금에서 모은 돈은 반려동물의 건강관리나 교육 등에 사용할 수 있도록 제한이 없다는 특징이 있습니다 :-)
                </div>
            </div>
        </div>
    </div>
    <br>
    <div class="end">
        <a href="/test/start" class="button-link">테스트 다시하개!
        </a>
        <button onclick="window.location.href='/product'" class="button-link">추천 상품 보러가개!</button>
    </div>
    <br>
</div>

