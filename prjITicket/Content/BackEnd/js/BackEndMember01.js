﻿let maxpage
const members = []
const emails = []

function AjaxMemberList() {
    $('#ctrlSearch').val($('#fKeyword').val())
    $.ajax({
        url: '/BackEndMember/MemberList',
        type: 'post',
        data: $('#ctrlForm').serialize(),
        success: function (data) {
            maxpage = data.length ? Math.ceil(data[0].Count / parseInt($('#fPageSize').val())) : 0
            $('#ListBody').empty()
            $.each(data, function (i, e) {
                let btnBan = `<button type="button" data-id="${e.MemberID}" data-email="${e.Email}" class="btn btn-danger btn-sm mr-2 customBan">停權</button>`
                let btnUnBan = `<button type="button" data-id="${e.MemberID}" data-email="${e.Email}" class="btn btn-secondary btn-sm mr-2 customUnBan">解除</button>`
                let btnInfo = `<span>停權至 ${e.EndTime} <a href="javascript:" onclick="theReason('${e.Reason}')">停權原因</a></span>`
                $('#ListBody').append(
                    `<tr class="${e.Reason === null ? 'text-body' : 'text-danger'}" style="background-color: ${members.includes(e.MemberID) ? 'lightyellow' : 'white'}">
                        <td data-id="${e.MemberID}" data-email="${e.Email}" class="pt-2 pb-1 text-body customSelectUser">${members.includes(e.MemberID) ? '<i class="far fa-check-square"></i>' : '<i class="far fa-square"></i>'}</td>
                        <td class="pt-2 pb-1"><a href="javascript:" onclick="theDetail(${e.MemberID})">${keyHighlight(e.Email.split('@', 2)[0], $('#fKeyword').val())}</a><br><sup class="text-secondary">&nbsp;&nbsp;&nbsp;@${e.Email.split('@', 2)[1]}</sup></td>
                        <td class="pt-2 pb-1">${keyHighlight(e.NickName, $('#fKeyword').val())}</td>
                        <td class="pt-2 pb-1">${keyHighlight(e.Name, $('#fKeyword').val())}</td>
                        <td class="pt-2 pb-1">${keyHighlight(e.Phone === null ? '' : e.Phone, $('#fKeyword').val())}</td>
                        <td class="pt-2 pb-1">${e.MemberRoleName}${e.Reason === null ? '' : '<span class="badge badge-danger ml-1">停權中</span>'}</td>
                        <td class="pt-2 pb-1">${e.Reason === null ? btnBan : btnUnBan + btnInfo}</td>
                    </tr>`
                )
            })
            let pagecurrent = parseInt($('#fPageCurrent').val())
            $(`#ctrlPage1 li`).not('.default').remove().end().removeClass('disabled')
            $(`#ctrlPage2 li`).not('.default').remove().end().removeClass('disabled')
            if (pagecurrent === 1) {
                $(`#ctrlPage1 li`).first().addClass('disabled')
                $(`#ctrlPage2 li`).first().addClass('disabled')
            }
            if (pagecurrent === maxpage) {
                $(`#ctrlPage1 li`).last().addClass('disabled')
                $(`#ctrlPage2 li`).last().addClass('disabled')
            }
            let showpage = [1, 2, pagecurrent - 2, pagecurrent - 1, pagecurrent, pagecurrent + 1, pagecurrent + 2, maxpage - 1, maxpage]
            let pointer1 = $(`#ctrlPage1 li`).first()
            let pointer2 = $(`#ctrlPage2 li`).first()
            let flag = false
            for (let i = 1; i <= maxpage; i++) {
                if (!showpage.includes(i) && flag) {
                    continue
                }

                if (!showpage.includes(i)) {
                    pointer1.after(
                        `<li class="page-item"><a class="page-link text-secondary customGotoNewPage" href="javascript:">…</a></li>`
                    )
                    pointer1 = pointer1.next()
                    pointer2.after(
                        `<li class="page-item"><a class="page-link text-secondary customGotoNewPage" href="javascript:">…</a></li>`
                    )
                    pointer2 = pointer2.next()
                    flag = true
                    continue
                }

                pointer1.after(
                    `<li class="page-item"><a data-id="${i}" class="page-link customGotoPage" href="javascript:" style="background-color: ${pagecurrent === i ? 'lightyellow' : 'transparent'}">${i}</a></li>`
                )
                pointer1 = pointer1.next()
                pointer2.after(
                    `<li class="page-item"><a data-id="${i}" class="page-link customGotoPage" href="javascript:" style="background-color: ${pagecurrent === i ? 'lightyellow' : 'transparent'}">${i}</a></li>`
                )
                pointer2 = pointer2.next()
                flag = false
            }
            let begin = ($('#fPageCurrent').val() - 1) * $('#fPageSize').val() + 1
            let ending = ($('#fPageCurrent').val() - 1) * $('#fPageSize').val() + data.length
            $('#ctrlPage0').text(begin <= ending ? `顯示第 ${begin} 筆到第 ${ending} 筆資料` : `查無資料`)
        }
    })
}

function theReason(reason) {

}

function theDetail(id) {
    const displayName = {
        'Email': 'Email',
        'Name': '姓名',
        'IDentityNumber': '身分證字號',
        'Passport': '護照',
        'NickName': '暱稱',
        'BirthDate': '生日',
        'Phone': '電話',
        'Point': '獎勵點數',
        'Address': '地址',
        'MemberRoleName': '角色權限',
        'Sex': '性別',
        'District': '城市',
        'SplitLine': '------------',
        'CompanyName': '公司名',
        'TaxIDNumber': '統編',
        'SellerHomePage': '商家網站主頁',
        'SellerPhone': '商家聯絡資訊',
        'SellerDiscription': '商家描述資訊'
    }

    $.ajax({
        url: '/BackEndMember/MemberDetail',
        type: 'post',
        data: { id: id },
        success: function (data) {
            let rows = ''
            for (let field in data) {
                if (field == 'SplitLine') {
                    rows += `<tr class="bg-dark"><td colspan="2"></td></tr>`
                    continue
                }
                rows += `<tr><th>${displayName[field]}</th><td>${data[field] === null ? '' : data[field]}</td></tr>`
            }
            let html = (`
                <div class="table-responsive text-body bg-white">
                    <table class="table table-bordered table-striped" width="100%" cellspacing="0">
                        ${rows}
                    <table>
                </div>
            `)
            $('#AjaxBox').modal({ backdrop: 'static', keyboard: false, show: true })
            $('#AjaxBoxBody').html(html)
            $('#AjaxBoxTitle').html('會員資料查詢')
            $('#OK').off('click').one('click', function () {
                $(this).prev().click()
            })
        }
    })
}

function thePrev() {
    let pagecurrent = parseInt($('#fPageCurrent').val())
    $('#fPageCurrent').val(Math.max(1, pagecurrent - 1))
    AjaxMemberList()
    $(window).scrollTop(225)
}

function theNext() {
    let pagecurrent = parseInt($('#fPageCurrent').val())
    $('#fPageCurrent').val(Math.min(pagecurrent + 1, maxpage))
    AjaxMemberList()
    $(window).scrollTop(225)
}

function keyHighlight(text, keyword) {
    const prefix = []
    const suffix = []
    for (let i = 0; i < text.length; i++) {
        if (text.toLowerCase().slice(i).search(keyword) === 0) {
            prefix.push(i)
            suffix.push(i + keyword.length)
        }
    }
    while (prefix.length) {
        let iS = suffix.pop()
        text = `${text.slice(0, iS)}</span>${text.slice(iS)}`
        let iP = prefix.pop()
        text = `${text.slice(0, iP)}<span style="background-color: springgreen">${text.slice(iP)}`
    }
    return text
}

function ResizeInitial() {
    $('#ctrlBtn').css('z-index', $(window).innerWidth() > 800 ? '1500' : '1')
    $('#ctrlBtn1').html($(this).innerWidth() > 1070 ? '<i class="far fa-bell"></i> 發送系統通知' : '<i class="far fa-bell"></i>')
    $('#ctrlBtn2').html($(this).innerWidth() > 1070 ? '<i class="fas fa-user-cog"></i> 設定查詢條件' : '<i class="fas fa-user-cog"></i>')
    $('#ctrlBtn3').html($(this).innerWidth() > 1070 ? '<i class="fas fa-ban"></i> 停權會員' : '<i class="fas fa-ban"></i>')
    $('#ctrlSubmit').html($(this).innerWidth() > 1150 ? '<i class="fas fa-search"></i> 搜尋' : '<i class="fas fa-search"></i>')
        .css('visibility', $(this).innerWidth() > 580 ? 'visible' : 'hidden')
    $('#ctrlReset').html($(this).innerWidth() > 1150 ? '<i class="fas fa-power-off"></i> 重設' : '<i class="fas fa-power-off"></i>')
        .css('visibility', $(this).innerWidth() > 580 ? 'visible' : 'hidden')
}

function MemberRoleInfoFont(value) {
    const fonts = [$('#ListHead1 span'), $('#ListHead2 span'), $('#ListHead3 span'), $('#ListHead4 span'), $('#ListHead5 span')]
    for (let font of fonts) {
        font.html('<i class="fas fa-sort"></i>').closest('th').css('color', 'black')
    }
    switch (value) {
        case '1a':
            fonts[0].html('<i class="fas fa-sort-down"></i>').closest('th').css('color', 'orangered')
            break
        case '1d':
            fonts[0].html('<i class="fas fa-sort-up"></i>').closest('th').css('color', 'orangered')
            break
        case '2a':
            fonts[1].html('<i class="fas fa-sort-down"></i>').closest('th').css('color', 'orangered')
            break
        case '2d':
            fonts[1].html('<i class="fas fa-sort-up"></i>').closest('th').css('color', 'orangered')
            break
        case '3a':
            fonts[2].html('<i class="fas fa-sort-down"></i>').closest('th').css('color', 'orangered')
            break
        case '3d':
            fonts[2].html('<i class="fas fa-sort-up"></i>').closest('th').css('color', 'orangered')
            break
        case '4a':
            fonts[3].html('<i class="fas fa-sort-down"></i>').closest('th').css('color', 'orangered')
            break
        case '4d':
            fonts[3].html('<i class="fas fa-sort-up"></i>').closest('th').css('color', 'orangered')
            break
        case '5a':
            fonts[4].html('<i class="fas fa-sort-down"></i>').closest('th').css('color', 'orangered')
            break
        case '5d':
            fonts[4].html('<i class="fas fa-sort-up"></i>').closest('th').css('color', 'orangered')
            break
        default:
            break
    }
}