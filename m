Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A942D10A16
	for <tools@linux.kernel.org>; Sat, 10 Feb 2024 06:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707548169; cv=none; b=rLF5ZW5GmgRymUlNph8ibM67D6VW0iht5T61Pruyw/NG+UiZX+vKMvSCHiZwdTXDtWcZWKa4/x2FZFdfW4CVKw2p1vlrNkCr9RoRG67Gv8Iwmz+fwyXbw/mE6V7D2Xwjo/HTOI84Nj/vwfH4YxgRJNV7hmbuhmgg1iwXKda1g5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707548169; c=relaxed/simple;
	bh=NVSOZpQjmNZbvBbytVbKbYZTTj5KexVg9+EBMGPo8iA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P4amY7Cx7KOz6qgwkvuGO+tNxl8K2KaD/LPIfgW4h8UTuRnh9E0Fw0exxZdCJ2p4dZwCW7n4s0ae+GXBn5y5/j4dP8XFjr6KAuS+PkaBgZIl/hYKmURAauqcvIBQf5Rt14oBNdYX4oV8++EFB3sk9EDp3dFK+l99fN8kEaHrAlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ICg348dq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ICg348dq"
Received: by smtp.kernel.org (Postfix)
	id 348B4C433C7; Sat, 10 Feb 2024 06:56:09 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4F91BC43390
	for <tools@kernel.org>; Sat, 10 Feb 2024 06:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4F91BC43390
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-296e8c8d218so1228198a91.3
        for <tools@kernel.org>; Fri, 09 Feb 2024 22:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707548167; x=1708152967; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7lqdmVzIJwt0NdDv6XcYQYzL0U+gQtOwIYPw83OVL8g=;
        b=ICg348dq2gYORloiKT5YAQGk1b64pbg/ybbB5t+phkJ2ZTevFeR1W0XW8qWDhUy/nE
         2jay4K08Q7s+OBVAhF4+tlBVJKj5ocVCvLnrxa1j6RvCvoWC9BQaIAzmsPPJA35G8WyA
         mu0QAu9qlGYwgCWdSIPBAqr2WAFStP6SfF4k4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707548167; x=1708152967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7lqdmVzIJwt0NdDv6XcYQYzL0U+gQtOwIYPw83OVL8g=;
        b=w97XL6huLYoQPXtniLXdeUFmCRASPAH+K1Ro2tOb/Vu/dSvYIqDlpR3GB8UKVeIGhP
         +chZlNYG1KlCp7Us8zuGuk7zYXoFpZrslXoMD0c1Dqd+7jgDZJRQuGyLfzmL0Xd0IUY6
         xJJ9mvGM8edaXlXm4VrfxmafrF3i5NjTY064L4QU+e+kr/dimgMgPFPnw+Fod+zG5DDk
         LPHwBzgH/9rbANGp0HAQF5NOUtDAYNOazBg63JYNxyBJA/VCnyKjc+OE0MVZH1l3r0la
         tjAzD88kKEds+BE0VH96ErQULbXqeVRC2HBObmHTwSiapAmIQHZIe1WlLGZjjBHJVo0w
         2TZw==
X-Gm-Message-State: AOJu0Yz2olVSTykcCjgOLnzzYkR1tY8dgk/lKK9FfzaGlKDRNXQxLsrK
	BljuWGJ1wsfPONXwJtnsMcy88SCeBTNGPLQA3/NELt3l6d+XhK7GMFDQEaQH1w==
X-Google-Smtp-Source: AGHT+IG8Uvto3IXh7IM+fA+MZ+Inj6FlHN977ejGAfyv7OajcSC0CUdI70yPsphZgCB7gunDHexmGA==
X-Received: by 2002:a17:902:f809:b0:1d9:7729:2a6f with SMTP id ix9-20020a170902f80900b001d977292a6fmr1497467plb.61.1707548167643;
        Fri, 09 Feb 2024 22:56:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWHNFwtwo2sj5Hgq9iT4SeharaFb3De5jNs2sKKLiRzhEOcJt9l0HQWoxTSJBuBbvBTHHP+w5FoKVroZZDidVlFmiko3Q3RPTYxPY8x9vc974PFN7dkbXledwzEmaGTCFNB1mAzMCu+0ZatG2sAA/J08eE57foSNwEJSd716ibUiYWvTqrzGTU9I8XM+zcpoHD/fw==
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id jz15-20020a170903430f00b001d9a40f50c4sm2491642plb.301.2024.02.09.22.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 22:56:06 -0800 (PST)
Date: Fri, 9 Feb 2024 22:56:06 -0800
From: Kees Cook <keescook@chromium.org>
To: tools@kernel.org, Joe Perches <joe@perches.com>
Cc: Lee Jones <lee@kernel.org>, Bart Van Assche <bvanassche@acm.org>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: .mailmap support for removals (was Re: [PATCH 00/10] scsi: Replace
 {v}snprintf() variants with safer alternatives)
Message-ID: <202402092252.0A0A59A@keescook>
References: <20240208084512.3803250-1-lee@kernel.org>
 <c9129b08-50fb-4371-aa05-6f6c7cd7acfa@acm.org>
 <20240208174912.GZ689448@google.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240208174912.GZ689448@google.com>

On Thu, Feb 08, 2024 at 05:49:12PM +0000, Lee Jones wrote:
> On Thu, 08 Feb 2024, Bart Van Assche wrote:
> 
> > On 2/8/24 00:44, Lee Jones wrote:
> > > Cc: Andre Hedrick <andre@suse.com>
> > 
> > Please take a look at https://lwn.net/Articles/508222/.
> 
> get_maintainer.pl pulled it from here:
> 
> https://github.com/torvalds/linux/blob/master/drivers/scsi/3w-xxxx.c#L11

Oh. Hm. It seems "git check-mailmap" (and get_maintainers.pl) don't
support a way to remove an email address -- only redirect it.

It seems we may want to support "don't use this email address" for more
than just the currently observed rationale. I don't have any good
suggestions for what the format should look like? Perhaps:

"" <address-to-remove@example.com>

?

-- 
Kees Cook
