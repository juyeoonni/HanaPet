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
            width: 0%;
        }
        100% {
            width: 25%; /* 25%의 너비를 지정 */
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
        <div>2/4</div>
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
            <div>우리 반려견의 나이가 어떻게 되나요?</div>
            <a href="/test/3" class="button-link">생후 3개월 ~ 만 3세</a>
            <a href="/test/3" class="button-link">만 3세 ~ 만 8세</a>
            <a href="/test/3" class="button-link">만 8세 이상</a>
        </div>
    </div>
</div>
