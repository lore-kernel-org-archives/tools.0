Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BC41DD0D4
	for <tools@linux.kernel.org>; Tue, 14 Oct 2025 16:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760457855; cv=none; b=laB+msIG7KdUootVH1kmYJYLk6BHt8QQm5bbZBYd7mfU3VbYEaEYf07+Vm4i2KdUiLOYs7ZaeJnezD9iYFO6eZY8Lh1dwCuqjYkHkCpbY7XmgA9i31sJOtZaJJsUlaNhgW7Lnl80Sn3e9E7T58XWkrwKHF9Cyi6GMn3Xo+6eHII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760457855; c=relaxed/simple;
	bh=7/JxSJYSrM1GT81Ns9biRLuEpOzlSawt0F+j/EMILrc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=NB3gDv1YJLq0G5kUYdMx99XTCLWV4F50SgZSSCwDp37sT2vohJvKeraPiz5+RQG++xy9uq1nmkzLUKSQd5UzaNqftykLAHP8mJ39gwLBkog4MJCBXrXdAS6ZDVrCEC2vKTroIKC4vZcOUUOoTuX04KAS9VlxCwo7CDILhUqM6rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id EC846C116D0; Tue, 14 Oct 2025 16:04:14 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8DEBFC4CEF9
	for <tools@kernel.org>; Tue, 14 Oct 2025 16:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8DEBFC4CEF9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-63bc1aeb427so5652439d50.3
        for <tools@kernel.org>; Tue, 14 Oct 2025 09:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760457852; x=1761062652;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qampm0WW5kUQbKh22t0hL+ig5C1/r4TdrH/pkn0BYxM=;
        b=iykDl6jzPjg9j4Ft1rnnzVCFljYRtmCdqDPgs3u1OF+kHeoYZioLbVT6qrvv9ZTfIv
         BMDdfsSYE9tEFyfGXk18MdQ/FgdJihrEm0NgsVvemxQAUnuTIFo1lYXwYghIBQXXbuFr
         9IwuO4d6wXn8JtrwdVTqD6Qx2WRHLWFqbbuXjy9ye8kvKZL5c85xYp2iOewW7nfDxEMb
         vmafNEWsXyPEJJnlZpXDCNthjJPsnBVMFI6yzzq2CG1wSuv7VzlRtJjKKmTlp4EFEvo7
         kK9Zylip20vCNuPU9jk16nFp5ZFuWtHEwPcK++xxVCSMaYWDwMps8aG7ewwfk3e+HT8P
         aT+w==
X-Gm-Message-State: AOJu0Yy85fHCa16rW0jZS0AbPD22egcJGTZ5rbCul75/epUNFKqUY1RI
	8QfrXaXmYU5o4wbDk2sM590PhtgLnHxFGbVYuqFWmbq500zTaqRW/onE36Asns5K
X-Gm-Gg: ASbGncvuGRosRUOcgGKjo3UDlE5dpNfL1NSn2fh+flbtoGh/RSRX5JOWNLX5NQDG5Pw
	zcozoxNZ/e9lVuago15pAJw0xWj7kGrxGRrcwkyAAJtVTJuJhiZ2hNe2k8b9w0hUklgScnQvNuo
	pnfEpyU27Odq/yQnCxPowVowZeF6sE1MtCYf50NBI/tx9WKqVCqRlMom3MoH+XI8MBGSGXHIAYx
	MEroiA1KY+b8TDRmW4kxnK41/g3xHoAlOTvCWZr8LQbohd3LqmxC7sLxHyz1XoEXnn4VzSM9Ow3
	qinQHxo8/9QxGmayH8Y9TATq7ljFpGHJF66dC6jfjfjSfTrB+02Vus72GdIqlV2PUgWQMBTnggb
	WpDftZYpVgCw9J3Zp1kIOO9lDchMWZ2FtOwBHrCI8IuJpKrKmOW7Lx1EqH+47iuhaNV5M5Zc+Tl
	TE9/cSrfPvX2c=
X-Google-Smtp-Source: AGHT+IF+kBtOkksj+myQIgqme6pGNbxYcioPWj0KRfsqoSphZseymkhoJoiQ89SnQZJy9bwXK07w1w==
X-Received: by 2002:a53:ec89:0:b0:629:9c6b:b3ab with SMTP id 956f58d0204a3-63ccb825baamr16389252d50.1.1760457852073;
        Tue, 14 Oct 2025 09:04:12 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-63cd95f3131sm4809999d50.26.2025.10.14.09.04.10
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 09:04:11 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7815092cd22so9212487b3.2
        for <tools@kernel.org>; Tue, 14 Oct 2025 09:04:10 -0700 (PDT)
X-Received: by 2002:a05:690c:b94:b0:71e:76e8:2457 with SMTP id
 00721157ae682-780e14593cbmr271537457b3.22.1760457850218; Tue, 14 Oct 2025
 09:04:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Oct 2025 18:03:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX40JoouK0yjm_-ggj5dQ9MtE2vrYhUOQ9dDpCN-0+tXg@mail.gmail.com>
X-Gm-Features: AS18NWADf7EvLTTEl-eHrrFUKL8oS1tL_1_Mvf6_UwBZqhMxqWJwIbJZYa5JTrs
Message-ID: <CAMuHMdX40JoouK0yjm_-ggj5dQ9MtE2vrYhUOQ9dDpCN-0+tXg@mail.gmail.com>
Subject: b4 am no longer prints file name
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org, users@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

Thanks for your hard work on b4!
I wanted to try "b4 dig", so I upgraded.  After that, I noticed that
"b4 am <Message-Id>" no longer prints the actual filename where it saved
the mbox.  Hence I now have to do a manual look-up.  Apparently this
was dropped in commit 8c0f498752924b3d ("mbox: refactor how we treat
base_commit for am and shazam").

Perhaps this printing can be reinstated?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
