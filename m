Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D992023A3
	for <tools@linux.kernel.org>; Mon,  9 Jan 2023 23:18:58 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id x11so9385606qtv.13
        for <tools@linux.kernel.org>; Mon, 09 Jan 2023 15:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xb/srepUPIj7G1pCpg/HsRyB/HZ4tZo0T8W4Sck8RUg=;
        b=Rc41YqTd+sFI6sFVor4XnZ6++gGzDT2RNF12t/eTT45b3wqiEQ+nIowYTokTLVhYEU
         t+vTWcoCA+2SdWmDQn4Qx+52IqF36NXVIQVo8NzKZsA6QWWZpRf8AUYP8rBzYhnDnY4j
         lwxlUJALCtsG5s+DOOTXjLIt/qoesCAWVbnF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xb/srepUPIj7G1pCpg/HsRyB/HZ4tZo0T8W4Sck8RUg=;
        b=7jEwR7VRV2yvcjSmF0thZ/f1ZP4zERz78zWCV2cXxI9lo2C2PgXiEhVDTUIDkEfSls
         fQxyvwLxBlBxz1vYhHZZBQlXjlZoBtBHzMfDlqaXWcTDB88acX2V/EDIA/QkQlHsMl3/
         uTIAGNbPmlUnbwGOK1jbqGyDUOwwcalefjfi2+NyDfFXnzFyJTBK0pqZI8z0mFuK3aK3
         f0gcgLBuSDl2LanSYoApUh1i3jJLrzrzGsBC1DZQkD9RatAaii96bVCy7ElXCmoTJQ/c
         g3SL/wSVHsBpkUCMyYO7mCza+ILtO+rbXyhtS/5im4j2fXL+Drq52R8zjokyn9x4xwub
         rWyQ==
X-Gm-Message-State: AFqh2kofLONkx4wMxIzB8o4hV7Z+7gvlouXeLeVm669YqlPviXgL4cvU
	NmLif81Vu2jo6IMaVg1h7JA0SV6DCvgLe6ec
X-Google-Smtp-Source: AMrXdXveR/t4/xSxQfNCxeW7uuzAnU0ZgaBlaOjBFa9J/eS4mFD4gxNOVdIwljDyTYDAezaX6svtbg==
X-Received: by 2002:a05:622a:4d0c:b0:3ab:d932:6c4e with SMTP id fd12-20020a05622a4d0c00b003abd9326c4emr18584358qtb.18.1673306337566;
        Mon, 09 Jan 2023 15:18:57 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id bx6-20020a05622a090600b003a81029654csm5256587qtb.31.2023.01.09.15.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 15:18:57 -0800 (PST)
Date: Mon, 9 Jan 2023 18:18:55 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
Cc: "Kernel.org Tools" <tools@linux.kernel.org>
Subject: Re: [BUG b4] misformatted email recipients
Message-ID: <20230109231855.wk3eepum7wiubawj@meerkat.local>
References: <20230109141516.ddljbbkzwk74bfwe@snowball.t-8ch.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230109141516.ddljbbkzwk74bfwe@snowball.t-8ch.de>

On Mon, Jan 09, 2023 at 02:15:16PM +0000, Thomas Weißschuh wrote:
> Hi,
> 
> it seems in certain cases b4 will misfold/misformat email recipient.
> The exact conditions are that a long address line pushes the comma
> separating different addresses to a new line during folding and that
> line contains unicode data that is encoded.
> In this case the comma is also encoded.
> 
> The root cause is a bug in Python email module [0].
> 
> Such misformatted mails are rejected by some mail servers, for example
> infradead.org.
> Also it seems they are not indexed by public-inbox [1].
> 
> I hit this case in the wild [2].

If you're feeling adventurous, the master branch has one big workaround the
problem (basically, we use our own routines to dump the msg to bytes -- not
too crazy, considering we're always working with non-mime plaintext structure
with minimal headers).

-K
