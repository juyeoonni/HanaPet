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
            width: 25%;
        }
        100% {
            width: 50%; /* 25%의 너비를 지정 */
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
        <div>3/4</div>
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
            <div>Q2</div>
            <div>이전 병력이나 유전병 등의 우려가 있으신가요?</div>
            <a href="/test/4" class="button-link">우려 없어요. 아직 건강하멍!</a>
            <a href="/test/4" class="button-link">기타 질환 등으로 고민이개!</a>
            <a href="/test/4" class="button-link">잘 모르겠멍!</a>
        </div>
    </div>
</div>