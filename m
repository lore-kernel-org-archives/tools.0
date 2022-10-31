Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1904424
	for <tools@linux.kernel.org>; Mon, 31 Oct 2022 21:09:57 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id h21so3235158qtu.2
        for <tools@linux.kernel.org>; Mon, 31 Oct 2022 14:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0wguFyywCE/UUfHPf5s+KAFvCwI/UjnR4jtvD3ob6I0=;
        b=Fjecu3Sv4z0AcEIWBpc/1tWIHQEZRxHi57c4U7NltgTFQ7LktI48TTJW8H8jqyafIi
         Brl7wuuXVrIoMIpajV/OhI1CpCeMe38S40/8NpCq42uKnqJcw/ysqBhtvSsabWx6xJ6n
         TljdhoX0XPAmzpTY1+7X8gAgh8J5na/59lcQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wguFyywCE/UUfHPf5s+KAFvCwI/UjnR4jtvD3ob6I0=;
        b=ECqJ6fL6icU4+15iW2tiqbiM2pB5IaWvnxrCAXdTGkXBA+1qA+Dm3Jr8HbpJpEvIDO
         xuGNPZcTcX69dFUZB7wBpRWEp/KfBHAwh/tvDuFtatSYq7DueuFFbXtXeZrbgmIsKhKc
         cBZazcJGGSt0gJ5aVW8VSEz937swBZw07e2l+MID9GTINDhb5rSaTT8P3oXlsqNpIDGf
         WZXMssAOLLmM7IxoWMOdaj62A5hC7uheElY3z8Oy6vdbTQbNm0Gs8lQ6cOXG2dEOLtvW
         ZF8v1Pmj7s5fRseCiBWA8K5GIP0LRodE3aL8nEtQ9AcsldnDIss2vSBvmaB7C+4Tthjd
         V0Pw==
X-Gm-Message-State: ACrzQf0oo4MGNh/SLNfdTK+UCjLtMnPJymo4IlPCga5/s/mQ9CWdSNtZ
	8s0wQ4okz2ffbgcurRpPbcT40ucW97pUlA==
X-Google-Smtp-Source: AMsMyM7vOvr8uADXj7VNpFxsu2d6liAfTyfoCuKfaQ4+LTpZ1juHaPcQSwu22ch5wOvRTZX3t8vldw==
X-Received: by 2002:a05:622a:152:b0:39c:b772:290 with SMTP id v18-20020a05622a015200b0039cb7720290mr12477632qtw.35.1667250596901;
        Mon, 31 Oct 2022 14:09:56 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id s13-20020a05620a254d00b006cf8fc6e922sm5332423qko.119.2022.10.31.14.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 14:09:56 -0700 (PDT)
Date: Mon, 31 Oct 2022 17:09:55 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	tools@linux.kernel.org
Subject: Re: b4 send --output-dir eml's sent with git send-email creates two
 From: in the mail body
Message-ID: <20221031210955.o5e4saatypmdfizc@nitro.local>
References: <20221019193208.euw2lv2d2anpzvdf@meerkat.local>
 <20221021195727.GA303980@bhelgaas>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221021195727.GA303980@bhelgaas>

On Fri, Oct 21, 2022 at 02:57:27PM -0500, Bjorn Helgaas wrote:
> > > The eml file created by b4 send --output-dir has the From: field using the
> > > current git identity which I assume is the issue.
> > 
> > Right, we're not doing quite the right thing here either, because when there's
> > a sendemail.from set up, we should be using that instead of the user.name +
> > user.email. I'll see how we can fix this up to do the right thing.
> 
> I think I'm seeing a similar issue.  I have:
> 
>   [user]
>         name = Bjorn Helgaas
>         email = bhelgaas@google.com
> 
>   [sendemail]
>         from = Bjorn Helgaas <helgaas@kernel.org>

I have a fix in master and stable-0.10.y that should do the right thing when
sendemail.from is set. I still need to write tests for it, but it appears to
be doing the right thing.

Best regards,
Konstantin
