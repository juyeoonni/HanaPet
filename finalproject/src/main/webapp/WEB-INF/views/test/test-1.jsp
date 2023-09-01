<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
    .progressbar {
        width: 400px;
        height: 15px;
        border-radius: 10px;
        overflow: hidden;
        background: #ccc;
        position: relative;
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
        <div>1/4</div>
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
            <div>Q1</div>
            <div>펫 보험과 적금 중 어느 금융상품이 더 나을지 고민 중이신가요?</div>
            <a href="/test/2" class="button-link">네</a>
            <a href="/test/2" class="button-link">아니오</a>
        </div>
    </div>
</div>

