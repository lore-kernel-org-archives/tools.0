Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D25C28E7
	for <tools@linux.kernel.org>; Fri, 20 Jan 2023 15:10:27 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id s4so4327148qtx.6
        for <tools@linux.kernel.org>; Fri, 20 Jan 2023 07:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3qynH7wRRlnqTqa2NIiMdtT+b1iluHvbfZvKdXE4uF8=;
        b=AOxownWYi1lRgUTXvK9o54UKSBae7UVLgmMr12UgRHKs42DWHSP3bGyWesy0YD9DdO
         KdCKIbl479liOXVSdm+8ZVN7ZXwEErbpOBc9aVzGR608vshsSJt51MWmPbH4YcSWH7Wu
         h/Ia/2EEYh6zx1ljxSMZ8xsJeHcapUz6gPIPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qynH7wRRlnqTqa2NIiMdtT+b1iluHvbfZvKdXE4uF8=;
        b=1bYW7Q9Sn1KJvSyXyBgccFuZ9WMt8/uylCipKhaYwCQEgDrJcWgEf3+TqjFBvtGUvU
         0hGiXk27vB4r/pzffbAPeCncvYVH/jT52ZBGjWbeFXBDhBUGg+SrsrnF05KI7TYzJMZG
         mHmr+HHnrxLm7UrGBlmbhieKsTvzxCtM3PiTZKbkHpqW3IlaFavpOizEbagKUC82YGzl
         bQZb9y+YDy9NfJ+PqaHQnJmrTiOVvF8FO3D5bwleJG2jiU7SsMUp3eQx5Nqu9oSyBkgJ
         n1Z/GI51sE8n7nH2TzFSYuwmXdf55vc7ZHAltJwprNy/dDu6ECLXlQXzahWspCc98Ixq
         3EOg==
X-Gm-Message-State: AFqh2krPnQw6Ljkw6i6wTIPgMkRXVTcQS65ET7l4LlHlbk/9alY7mj3T
	8vGQjZl+7pUqBPTB+Z8PWI8OxJFTUaAMm5u7
X-Google-Smtp-Source: AMrXdXuZEDWx9RpG93Q8i2C8MXF9ZEaEQMBHhvpqOaUuYD6TE0O7mJk8AO2PqUhi2thJTS1H4LwujQ==
X-Received: by 2002:ac8:730a:0:b0:3b6:3a71:e939 with SMTP id x10-20020ac8730a000000b003b63a71e939mr21813597qto.7.1674227426855;
        Fri, 20 Jan 2023 07:10:26 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id cb15-20020a05622a1f8f00b003ab43dabfb1sm7786009qtb.55.2023.01.20.07.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 07:10:26 -0800 (PST)
Date: Fri, 20 Jan 2023 10:10:24 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: tools@linux.kernel.org, dri-devel@lists.freedesktop.org,
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: pr-tracker-bot for drm subsystem?
Message-ID: <20230120151024.nflfvgl55wfl6ppj@meerkat.local>
References: <87a670spdw.fsf@intel.com>
 <87a62dadi9.fsf@intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87a62dadi9.fsf@intel.com>

On Fri, Jan 20, 2023 at 09:09:18AM +0200, Jani Nikula wrote:
> 
> Konstantin?

Sorry, I didn't mean to scholz you around. The pr-tracker-bot is very much a
bespoke solution for Linus, so adapting it to other subsystems is not very
trivial, which is why I've been sitting on this request without any movement.

The code for the bot is available here:
https://git.kernel.org/pub/scm/linux/kernel/git/mricon/korg-helpers.git/tree/pr-tracker-bot.py

I can take a look at it in the future, but at the moment I'm still not able to
work on it, sorry. :(

-K
