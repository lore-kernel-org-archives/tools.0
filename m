Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0144E61
	for <tools@linux.kernel.org>; Wed, 10 Mar 2021 19:57:17 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id l132so18200515qke.7
        for <tools@linux.kernel.org>; Wed, 10 Mar 2021 11:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=gaOvXY9tbO+ZBb/g8njgoQVsRE4VzbJZFeY6jSNkMEY=;
        b=fNUOFZ1stakWICtKnDpDrXU8gyNE0gxZAhjO90SWwkCQqdY+waLuxmDve84pzc/N6L
         YLp91uV16nhbv1+QqFpjJS9wftNmYgH7UpIZ2/buW42G2/4Guy/GniQa01iHJomTzj00
         vuX7+uOOqRrKVZZtmXKVTBoLWASTWOpkm80Kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=gaOvXY9tbO+ZBb/g8njgoQVsRE4VzbJZFeY6jSNkMEY=;
        b=ZiWzYH2SUEgH/FTrcxGl8cnVJMH3G+hTP1XIl21yrXuzA1HN/dNr0weglrpz9K+FXI
         xWksGajhGpRLHsxA77zw/n9dQDHLTWoBdShqLBNAnQByaM0X2/e+sl2oi5R0YVTcxCHK
         k/BUh26p7VE3I4dupBH2wK1XzHx26p06JiUrj94valXdHaPA7RproF4UuzydxUac/yAq
         fYXCR2ux35nCMsIuH7Ncqgkcze6Kwd6jfexnI13UJ/qVRrd/czWZjEqNrOGlRdr1oNLs
         EzCsxcqmTfQ66qy5bwfDFjgSYRjew2rVhBRxu3bfJ6uRMae4IvVXc1Ru5mLYKRNJT0jZ
         PR7A==
X-Gm-Message-State: AOAM531JU8D95IxX4aouSXPYxQkOwSLFhsHd3mpYke/Fk3KVIK/i16Q4
	4BOmfyo/+E9d84Cl2aF+m3CQ0Q==
X-Google-Smtp-Source: ABdhPJzq3srzqOZQhp3/QoEtd26O9uapy2AR4/yhXFjslhGiavdEP9fON48soonYn4+CWoNxi4/3Xg==
X-Received: by 2002:a37:496:: with SMTP id 144mr4431743qke.324.1615406236873;
        Wed, 10 Mar 2021 11:57:16 -0800 (PST)
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id l65sm235438qkf.113.2021.03.10.11.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 11:57:16 -0800 (PST)
Date: Wed, 10 Mar 2021 14:57:14 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: tools@linux.kernel.org, Arnd Bergmann <arnd@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Subject: Re: b4 claims patches are missing
Message-ID: <20210310195714.25exkovf5oneqwtl@chatter.i7.local>
References: <20210310194437.GA2035122@bjorn-Precision-5520>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <tools+subscribe@linux.kernel.org>
List-Unsubscribe: <tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210310194437.GA2035122@bjorn-Precision-5520>

On Wed, Mar 10, 2021 at 01:44:37PM -0600, Bjorn Helgaas wrote:
> Not sure what happened here.  Mutt sees this, which *looks* like it
> should work:
> 
>   - Mar  8  9:24 Arnd Bergmann   [PATCH 1/3] PCI: controller: al: select CONFIG_
>   - Mar  8  9:24 Arnd Bergmann   ├─>[PATCH 2/3] [RESEND] PCI: controller: thunde
>   - Mar  8  9:24 Arnd Bergmann   ├─>[PATCH 3/3] [RESEND] PCI: controller: avoid
>   - Mar  8 17:11 Krzysztof Wilcz ├─>Re: [PATCH 1/3] PCI: controller: al: select

Hmm... Yeah, it's a bug due to "[PATCH X/N] [RESEND]". We try to deal with
lists that add extra bracketed junk to subjects like "[alsa-devel] [PATCH
X/N]", so we drop all bracketed prefixes until the last one. The debug output
shows what's happening:

	Analyzing 5 messages in the thread
	Looking at: [PATCH 1/3] PCI: controller: al: select CONFIG_PCI_ECAM
	  adding as patch
	Looking at: [RESEND] PCI: controller: thunder: fix compile testing
	  adding as patch
	Looking at: [RESEND] PCI: controller: avoid building empty drivers
	  adding as patch
	Looking at: Re: [PATCH 1/3] PCI: controller: al: select CONFIG_PCI_ECAM
	  adding to followups
	Looking at: Re: [PATCH 1/3] PCI: controller: al: select CONFIG_PCI_ECAM
	  adding to followups

We clearly need to be more careful when doing subject normalization. I'll try
to work around this. Thanks for the report.

For now, you can do "b4 mbox" that thread, edit subjects to remove the
[RESEND] bits and then "b4 am -m ./that.mbox".

Regards,
-K
