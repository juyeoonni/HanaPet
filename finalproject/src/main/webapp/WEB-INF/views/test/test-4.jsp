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
            width: 50%;
        }
        100% {
            width: 75%;
        }
    }
</style>
<div class="modal-c">
    <div class="top">
        <div>4/4</div>
        <div style="display: flex; align-items: center">
            <img src="/resources/img/left-arrow.svg" width="30px"/>
            <div class="progressbar">
                <span class="progress"></span>
            </div>
        </div>
    </div>
    <div class="middle">
        <img src="/resources/img/test4.svg" width="423px"/>
    </div>
    <div class="end">
        <div>Q4</div>
        <div>1년에 지출하시는 대략적인 병원비를 알려주시개!</div>

        <div style="display: grid; place-items: center">
            <a href="/test/result" class="button-link">30만원 이하</a>
            <a href="/test/result" class="button-link">30 ~ 100만원 사이</a>
            <a href="/test/result" class="button-link">100만원 이상</a>
        </div>
    </div>
</div>
