Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.6263.1589291978001526752
 for <tools@linux.kernel.org>;
 Tue, 12 May 2020 06:59:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SdQJLYlQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.169, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f169.google.com with SMTP id y22so978776qki.3
        for <tools@linux.kernel.org>; Tue, 12 May 2020 06:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=PXz/RhXd53hObtV/6jE/cbRWIIF5dkn8pi6S27o2a4w=;
        b=SdQJLYlQrhhJ876W/djZFJOE89Q+5/w6xb3TJDcKFNwM1FgJBn+ngP1J24iPU4qpeE
         lQLPojmrk+l/BSYKKfW9sb7xqUdXNLz8SgkwHnFXnf1jF8etTIQwqjLj//ZzvUmFv9To
         MvKRkXDY0GCrbdezXSTtdPSGR4aXwBrq/zSpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=PXz/RhXd53hObtV/6jE/cbRWIIF5dkn8pi6S27o2a4w=;
        b=C/HnQ5kBfh8R1iyZqDWIJaDbjNLGGXMQc/7gBSUOA5gNbPV1GKPr/IfRr0xrkiMdwl
         J2D5Ek9NDqMmzUnNLMDxHE8okc578b1YBlJ5gTCuDeKj9G1Msqsg9nFPFwHOd4UqsPZf
         BmH69TJEBvIdxAv04nhy5FtNs+Vgpw58xwg1UqdZhHmEiqR7exO0G/qEzPpxLVdKdmda
         M5UhwQ4YtUXOeexksLfyHbhtxRaX7pnA8e3g1an0G93p3FVVuyPLCDM3DK0IMNh4dw4x
         k4fN0wmrL0W8csverBR/FADgnwsZUaSSl7jLxnMRW9SKL/GJvDplf5mQvmpUe4iUm4RA
         E3dA==
X-Gm-Message-State: AGi0PuZU2dyhyrxOIwT6H9gfZxuoezw9lbcralgsRDQk+UTnMgFbd5lA
	JiVkq5chHecYtgMHpND+V58RANxoxpA=
X-Google-Smtp-Source: APiQypJ0s06B46f4lAAgk/WArBc7yXFAWUBqnbFU8Rw5rCt3yrrJiIKi6/MxhoOB2Qs+g5ZP6ZGwGw==
X-Received: by 2002:ae9:e713:: with SMTP id m19mr21006730qka.39.1589291976822;
        Tue, 12 May 2020 06:59:36 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from i7.mricon.com (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id t21sm4780057qtb.0.2020.05.12.06.59.34
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 06:59:35 -0700 (PDT)
Received: by i7.mricon.com (sSMTP sendmail emulation); Tue, 12 May 2020 09:59:33 -0400
Date: Tue, 12 May 2020 09:59:33 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Subject: b4 0.4.2 bugfix release out
Message-ID: <20200512135933.t5yhgwt4xfiblx2j@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello:

I released b4 v0.4.2 that fixes some things with "b4 ty" workflow that 
got broken in v0.4.1:

- fix auto-thankanator logic that started matching everything
- properly process branches for remote without a [branch] entry

You can update using "pip install --user --upgrade b4".

Best regards,
-K
