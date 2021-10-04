Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772173FDE
	for <tools@linux.kernel.org>; Mon,  4 Oct 2021 20:41:12 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id b65so17801648qkc.13
        for <tools@linux.kernel.org>; Mon, 04 Oct 2021 13:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fk4fdZnMk6tzfDxmGQCN1qNjPwits+1q1kUJ9yNBigU=;
        b=HKRqisSeFUsUmDYrBmFleJPUX1l5gMM1I9v8DaUR7dm5co4DKhbsMnb7qbDhD2vA0p
         4k6RSnCe1tdsseyi/sTxMJJjxpsK77qOnTKijBTJY0XyxhthFXiEaT1PpPf/lTx3dukE
         IuOYoxgb0z+JdAI3qZZ2RE+OUpksnGDnkFiQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fk4fdZnMk6tzfDxmGQCN1qNjPwits+1q1kUJ9yNBigU=;
        b=aLuyGuMa4nmjibNrDfUBUPO5tJt4qtAIg1H3rGGEjE2sWTNIcfwMdEd+EwohS1w3U1
         vyxBTF9r29SPydhmiH9y9rqLtf1QglJ4MLqJ2IxiZfG5ApFYudlFUskoUTr4uFl3j3k8
         zApuyanXI/oWfYh8dE3xkD7vOttlNAJjwi1yYju+3gWoy4dHGAjejdFkz4xHow69xZfl
         IYBoYf+wF6EGZj/Q0XMiPXqChVF+ChEp0JBRBoO1vtmj73BZKQ20BKSVjDCoyjwsclRb
         bRHfI+4o6VtQNlprxNnVrPjGyvQGDaflrlcg5bc9rw+9w010wFj8LpqaeLoIuRNv51E7
         KuZA==
X-Gm-Message-State: AOAM53390cyO4x4HiZdU0QDCaspz92dUehwG0EXgrfwL/+uQoN2iDokn
	2tl0YAr2NrQH83DZn29az3b9NA==
X-Google-Smtp-Source: ABdhPJxToQqE/UzlY9HK/sBYwxbphf7n9lS1Lvy598M78P6m+mNA8FhLPLuko5CO8gAnZr9TmmGVag==
X-Received: by 2002:a37:668d:: with SMTP id a135mr11435863qkc.288.1633380071427;
        Mon, 04 Oct 2021 13:41:11 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id h4sm9618885qtb.67.2021.10.04.13.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 13:41:11 -0700 (PDT)
Date: Mon, 4 Oct 2021 16:41:09 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Kees Cook <keescook@chromium.org>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH] validation: Report lack of signature
Message-ID: <163338003298.58022.2348253631013674637.b4-ty@linuxfoundation.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=437;
 h=from:subject:message-id; bh=W1k1P+SlguU+qroohPOfRNm36FLk0X8/NqtVactKR7M=;
 b=owGbwMvMwCG27YjM47CUmTmMp9WSGBKj046FqK2f6Nvy4vT3y9G3Jae9+HZ2HydDxuSnv9q/inP+
 ElJx6ShlYRDjYJAVU2Qp2xe7KajwoYdceo8pzBxWJpAhDFycAjARjz6Gf8ZFvVsf9sh80K3l99k2/S
 2L87MGDZfasPMu7Z3ZMe9X8DIy7DQUWNejcPPMorDP/MqxixY36ezc9UK2veuit3Jh8/7ljAA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E
References: <20211002025717.3337059-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211002025717.3337059-1-keescook@chromium.org>

On Fri, 1 Oct 2021 19:57:17 -0700, Kees Cook wrote:
> If we're trying to cryptographically validate a message, not having a
> signature is not a success (exit 0). Use a specific return code for this
> condition and report it.
> 
> 

Applied, thanks!

[1/1] validation: Report lack of signature
      commit: 4870cf5db4325622ee68f6a47f920e5faea3ffff

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
