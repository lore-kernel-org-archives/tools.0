Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88621332E1
	for <tools@linux.kernel.org>; Fri,  2 Jun 2023 16:44:19 +0000 (UTC)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-457080dc902so649853e0c.2
        for <tools@linux.kernel.org>; Fri, 02 Jun 2023 09:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685724258; x=1688316258;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BeWMHRdm/gIPMPZnqkD8g9PoiM6WDKqIoFUlb3OQkv0=;
        b=GB2gdNXNYJwbdBFKHntTKAz54JAQdAKGGQxnF9DuEFBsDH/7oZPiZT8lyTO12S3Atv
         FlL9rz3DnSfRk0D0AXuqRszrajd8Hk60CsNfffFDIxUdexYIeT2sSxpQu0qQrt2USGdq
         QyVNbxTVhWFEMcb4ies56V62RNNPUTkQ+627A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685724258; x=1688316258;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BeWMHRdm/gIPMPZnqkD8g9PoiM6WDKqIoFUlb3OQkv0=;
        b=brlJNIf9aonM0LiyvowLjfH6N1az5tz4hc6+rR9JSZdfjANAUyHH6V7ez8NqMb1nLq
         nmhmrEqtdoTi1XPf0muKe4sXvWtwSOR3gxayxeumm4UUs94SOARMuwntR3BRSvQhiOb7
         lfKXsi5C4UnD5urJN1JWK84OVXIbWAyHP47VbndwOQV9EdwuTd3Fkyqhu6IAsqnH0Maq
         MDRj2jop8vmis2GcR5FSIG4W62M8DreHUCk5MDdzGz0+sDYhLxEW/vDPgve2IRWjhsa4
         JNq9m/Hi6JRkPlGLMcltISErnNCRsvTTzmA/7GI8p+Xqx5BdieKHp8kSkUSd6UvyaWbd
         zRNw==
X-Gm-Message-State: AC+VfDzyX/dOw1zsdOj61rq6/CDuI+oLVn65PPA51VUY69rtWtQULw9q
	7oldCxqtwW+8EwzvagWMUUGXi4j+GGmcucMCBms=
X-Google-Smtp-Source: ACHHUZ559gxwDGLwphqbvODgUxda4qbOuDEWEmmSqQq1AxRuEhiSRB/NiC4U6FBLOahobp4SuU/aqQ==
X-Received: by 2002:a1f:5cd5:0:b0:45d:edef:788c with SMTP id q204-20020a1f5cd5000000b0045dedef788cmr2635209vkb.1.1685724258223;
        Fri, 02 Jun 2023 09:44:18 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-132.dsl.bell.ca. [209.226.106.132])
        by smtp.gmail.com with ESMTPSA id l20-20020ae9f014000000b007590cbe71aasm800994qkg.72.2023.06.02.09.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 09:44:17 -0700 (PDT)
Date: Fri, 2 Jun 2023 12:44:16 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Maximilian Weigand <mweigand@mweigand.net>
Cc: tools@linux.kernel.org
Subject: Re: b4: workflow for selecting to/cc targets of individual patches
Message-ID: <20230602-underarm-stuffy-e6e9fa@meerkat>
References: <bdefe087-28a2-d541-933c-ccd743cc8b62@mweigand.net>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bdefe087-28a2-d541-933c-ccd743cc8b62@mweigand.net>

On Wed, May 31, 2023 at 08:57:58PM +0200, Maximilian Weigand wrote:
> My understanding (also from reading a bit in the tools archive) is that
> the cover letter should be addressed to all maintainers and mailing
> lists targeted in any of the patches, while individual patches should go
> only to the maintainers (via To:) and lists (via Cc:) they are targeted at.

My (very unscientific) polling that I held at the time when I was implementing
this suggested that pretty much all maintainers want to receive the entire
series, even if only a single patch out of 10 touches their subsystem. Seeing
the whole series allows them to better understand the patch in the context of
the larger change.

> Using b4 prep --auto-to-cc is not an option here, as all To:/CC:
> addresses in the cover letter will be used in all patches (my
> understanding, based on b4 send --dry-run tests).

I believe that you should just use this option and blame the tool if someone
complains (and I highly doubt that anyone will). :)

-K
