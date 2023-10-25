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
            width: 25%;
        }
        100% {
            width: 50%;
        }
    }
</style>
<div class="modal-c">
    <div class="top">
        <div>3/4</div>
        <div style="display: flex; align-items: center">
            <img src="/resources/img/left-arrow.svg" width="30px"/>
            <div class="progressbar">
                <span class="progress"></span>
            </div>
        </div>
    </div>
    <div class="middle">
        <img src="/resources/img/test3.svg" width="423px"/>
    </div>
    <div class="end">
        <div>Q3</div>
        <div>이전 병력이나 유전병 등의 우려가 있으신가요?</div>
        <div style="display: grid; place-items: center">
            <a href="/test/4" class="button-link">우려 없어요. 아직 건강하멍!</a>
            <a href="/test/4" class="button-link">기타 질환 등으로 고민이개!</a>
            <a href="/test/4" class="button-link">잘 모르겠멍!</a>
        </div>
    </div>
</div>