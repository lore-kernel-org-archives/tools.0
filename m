Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28E133D4
	for <tools@linux.kernel.org>; Wed, 13 Sep 2023 20:00:37 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-64f383be0d4so1371346d6.3
        for <tools@linux.kernel.org>; Wed, 13 Sep 2023 13:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694635236; x=1695240036; darn=linux.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i5jRnt+JlD3qmQAFnK2qYWwSJNGD6KpoGOYMcuR1ECI=;
        b=aNSThqVpiQC7jK1Z/6HTdO7/ZhgljQDas8fL86ijj1K6LDHcrqj+gSAx3bGvqdHGgS
         7NFRCyzdm354MWwi+MEmxMKMapISx0m0khkHdkG8jb0IFte5Pc6KqCpdf/sokjtQPtB0
         RXZcEgNrZhkkuI4gmDcqF+GgapZt2Pudwv7Tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694635236; x=1695240036;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i5jRnt+JlD3qmQAFnK2qYWwSJNGD6KpoGOYMcuR1ECI=;
        b=XjFMNUCnvHM1BdsF76nfTsJG+oLdo9gk0/X1+sfdyu+cA4gpriMLIB4/7czyr2cqGd
         ijAqaYef3CEzB9nR+d6doxG5Q4fjo5UbzANe56YHCGb5rfp/DpSbWSbstfDHaet84+dP
         oG+HlOFot98cXGSL31QFKBMUEA7OFbARvgGUm7TAN4UcITlDHnTIGc9oy/VEUAG46/9v
         DEWYWNvXnWNxJdzvB8XsCHoJ4jyVhmVSrZcV0T9fwuKEpGamfKc/MFS1f/WDt4AxlRhS
         9SXwcTgFochRPNOgeoncIOrzDdMYSYVZthTPto/vy7WSSOlM1FPQq35XQGeS/GfarIv8
         AqKg==
X-Gm-Message-State: AOJu0YwZTzMd/sHyvkGDA4386GanBjoiD3Mx7BN+EHV2eFOgol8bu/TY
	Ncz2xRjMT0G8GgiiEiwnIVKuGQ==
X-Google-Smtp-Source: AGHT+IHYw74rx0XiHDmpTVkb5WPO5yvKXZN0/mXYNU+Kdxvg4pI8RtpeSwp7xNyOX/0PuFWFOPTPhg==
X-Received: by 2002:a0c:e286:0:b0:651:62a3:647d with SMTP id r6-20020a0ce286000000b0065162a3647dmr3106068qvl.33.1694635236472;
        Wed, 13 Sep 2023 13:00:36 -0700 (PDT)
Received: from meerkat.local ([209.226.106.110])
        by smtp.gmail.com with ESMTPSA id u11-20020a0c8dcb000000b0063cdbe739f0sm4716436qvb.71.2023.09.13.13.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 13:00:36 -0700 (PDT)
Date: Wed, 13 Sep 2023 16:00:27 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Kees Cook <keescook@chromium.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 tag parsing too lax?
Message-ID: <20230913-lunchbox-anemia-a19bc1@meerkat>
References: <202309131243.5D508355@keescook>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202309131243.5D508355@keescook>

On Wed, Sep 13, 2023 at 12:44:43PM -0700, Kees Cook wrote:
> Hi,
> 
> I just saw this in commit ef6e1997da63 ("wifi: mac80211: fortify the
> spinlock against deadlock by interrupt"):
> 
>   Reviewed-by: tag, or it goes automatically?
> 
> I tracked it down to:
> 
> https://lore.kernel.org/all/074cf5ed-c39d-1c16-12e7-4b14bbe0cac4@alu.unizg.hr/
> 
> I can't tell if we should just deal with kind of unfortunate misparsing,
> or if b4 should require at least a "@" in the tag? (Though plenty of
> tags are just someone's name without an email in the cases where no
> email was available...)

I don't think b4 did this, because we already have precautions against this in
place. E.g. if you retrieve that with b4, you will see that it doesn't get
confused by that line:

$ b4 am -o/tmp https://lore.kernel.org/netdev/074cf5ed-c39d-1c16-12e7-4b14bbe0cac4@alu.unizg.hr/
Analyzing 5 messages in the thread
...
---
  ✗ [PATCH v4 1/1] wifi: mac80211: fortify the spinlock against deadlock by interrupt
    + Reviewed-by: Leon Romanovsky <leonro@nvidia.com> (✓ DKIM/kernel.org)
  ---
  ...
---
...

While it's possible that b4 did this, it's not any current version.

-K
