Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590DB2FAE
	for <tools@linux.kernel.org>; Wed,  1 Sep 2021 13:25:28 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id x5so2474129qtq.13
        for <tools@linux.kernel.org>; Wed, 01 Sep 2021 06:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=k2ilVOVgMln17i+CdsYJnFgLmVQ6DhMJ7KC4QdPl4qQ=;
        b=ATpEC6cVveljDPemBUDs2CYOog6lyyPGlDU2w7Uo+JmWwGcyQl8asEQVKVWLvaY28V
         /t6F+D3O/B8gxG0HPzfTC6kGVZg9et5RJdJWQuLNwWiasbXHvpewZ9KJd5/t4ySJIKRc
         gRiKLbVpB/4/nPvoD4CvcrenjX75JboQ4CqDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=k2ilVOVgMln17i+CdsYJnFgLmVQ6DhMJ7KC4QdPl4qQ=;
        b=Ty3NAr7hnUGkqZ3mzhjJfcf1BQwgNDXbJP6lZh+hWbpH3BJVAKEgtWG/xMXVUUW3y5
         hdKY3pBF5udy+4cyv7PsYJr9941D26xR8blenrqh8q58jwtWERdNrhggvO9gyRxHDjPw
         sySm+3vjuBghFhBCtpfTUhOVh6Z91WCZhc2mnPr/t1rkX/hm4wA9T7b8u3tCICV7SlkX
         bIpmwoHShOccR7bTP1DNN87HSpdgITdYo2POcPltoL1eUEa48dAP2SF1DkAW6fwth1bV
         zWkGdn7Y58mMsPGTPqNztDR8mLzx+jpW/o8q9vd5ogz5vDaJNN9wRFqvNBxvUM9v8WTf
         4r1A==
X-Gm-Message-State: AOAM532yBhQVgeLp19tCWx2NJx41BPGGYwW7H3fTEyVt4W/Y9mQKXd9O
	LT/A504j1ixtkn6kIsG3aecLRxRgrymuXyV6
X-Google-Smtp-Source: ABdhPJwS313znLL8LvSLvBc2AppCFQrLkaTAQC52NtMJt8xQKZocK0tpw3BNu3Jn/lmUhCJy+ngITQ==
X-Received: by 2002:a05:622a:394:: with SMTP id j20mr8155471qtx.196.1630502721513;
        Wed, 01 Sep 2021 06:25:21 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id n14sm12586193qti.47.2021.09.01.06.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:25:21 -0700 (PDT)
Date: Wed, 1 Sep 2021 09:25:19 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: lore.kernel.org upgrade: Sep 1, 2021
Message-ID: <20210901132519.vxw2wrly4pifnorv@meerkat.local>
References: <20210830164626.tq5emfrht4o46x33@nitro.local>
 <20210901131259.7slxtcftirxb4bhp@linutronix.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210901131259.7slxtcftirxb4bhp@linutronix.de>

On Wed, Sep 01, 2021 at 03:12:59PM +0200, Sebastian Andrzej Siewior wrote:
> On 2021-08-30 12:46:26 [-0400], Konstantin Ryabitsev wrote:
> > Hi, all:
> Hi,
> 
> > My tests of the new lore.kernel.org service (currently running on
> > x-lore.kernel.org) are looking good, so I will be putting that into production
> > on Wednesday, September 1, 2021.
> 
> x-lore misses a hostname in its cert:
> 
> | This server could not prove that it is lkml.kernel.org; its security
> | certificate is from ams.source.kernel.org. This may be caused by a
> | misconfiguration or an attacker intercepting your connection.

Thank you for the alert -- looks like my deploy missed a step. It should fix
itself once DNS entries propagate to you.

-K
