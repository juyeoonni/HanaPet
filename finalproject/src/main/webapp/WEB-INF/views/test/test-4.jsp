<style>
    .progressbar {
        width: 400px;
        height: 15px;
        border-radius: 10px;
        overflow: hidden;
        background: #ccc;
        position: relative;
    }

    .progressbar::after {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        height: 15px;
        width: 0;
        background: #BFDFCB;
        animation: progress 1s ease forwards;
    }

    @keyframes progress {
        0% {
            width: 50%;
        }
        100% {
            width: 75%; /* 25%의 너비를 지정 */
        }
    }

    .progress {
        position: absolute;
        top: 0;
        right: 0;
        z-index: 99;
    }
</style>
<div class="modal-c">
    <div class="top">
        <div>4/4</div>
        <div style="display: flex; align-items: center">
            <img src="/resources/img/left-arrow.png" width="20px" style="margin-left: 15px"/>
            <div class="progressbar">
                <span class="progress"></span>
            </div>
        </div>
    </div>
    <div class="middle">
        <img src="/resources/img/dog.png" width="200px"/>
    </div>
    <div class="end">
        <div>
            <div>Q4</div>
            <div>1년에 지출하시는<br>대략적인 병원비를 알려주시개!</div>
            <a href="/test/result" class="button-link">30만원 이하</a>
            <a href="/test/result" class="button-link">30 ~ 100만원 사이</a>
            <a href="/test/result" class="button-link">100만원 이상</a>
        </div>
    </div>
</div>
