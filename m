Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E60C8486
	for <tools@linux.kernel.org>; Thu, 27 Oct 2022 16:57:26 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id ml12so1908384qvb.0
        for <tools@linux.kernel.org>; Thu, 27 Oct 2022 09:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5/U5hdECfoRnOOd/huKx/hRPagSAgTqrxdN8CbfrzIY=;
        b=TfALz/bGHQ/p0jnAIRqd6w0X3jlGZ1sYi/kyl4BTeAV9su5vt7hFZqUenyI2WyOq/M
         Uw+MBXfQX9eiqYsKSUeFl6dgh4wPrFtVIHG5th1++epm+09R/eNp+hvyqlwMW22GLDH4
         833xp7VqbtOUe9j+2yts6tdVSAu1A7BGV9mm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5/U5hdECfoRnOOd/huKx/hRPagSAgTqrxdN8CbfrzIY=;
        b=QMuzmeZj//odo9XxA//N6bSHAumnCw4DWcjMaqFGonhFfgQ54dnTD35ORBJ7TAqpZL
         N7An+LNdL38ru/ej48Ga6PnYtRtBgR5K2zurCuhe+2maj8dA/8QKkwbg71kYrFDEdTl1
         9XwnRUl88e32gLFBSxOOfKpPlwpaYm5s9I7GSPEqtx5z2tkM2TOlqT6oKrn4L4VQR/Hz
         RYh0faEfiQ0cPwVqap2Ud29VyPUZGNxjJnNKu1/EKsSITuPzqFyMqHi58/ydSjWgwOc1
         i9e3cqBVhp9elcZvi9sp9y9SkBMCi8h3vE9uE5dCXeoXhmLdJNIWeQ8JBpPv6GddRSw9
         vxrw==
X-Gm-Message-State: ACrzQf0FMSodOGsV4JiLyEqfSm4xiAYoPB2nwnfTJueULy2H9ejdsDQe
	1Bfs+3EDGF18rURFuV46231v3J4cPijEKg==
X-Google-Smtp-Source: AMsMyM4DUJRlNiqTsAq2eoe+CRTah+rtP+ncfKqiAhutflsBAabOrViqHaEoVhx5f+cq0yX7u0ARBg==
X-Received: by 2002:a05:6214:2a8f:b0:4bb:6c0d:f2e4 with SMTP id jr15-20020a0562142a8f00b004bb6c0df2e4mr19092902qvb.18.1666889845103;
        Thu, 27 Oct 2022 09:57:25 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id br7-20020a05622a1e0700b00399ad646794sm1122107qtb.41.2022.10.27.09.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 09:57:24 -0700 (PDT)
Date: Thu, 27 Oct 2022 12:57:23 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH] pr: Add --nostdin, to disable TTY detection
Message-ID: <20221027165723.cz32tduwdj7er6g7@meerkat.local>
References: <20221012230211.29402-1-palmer@rivosinc.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221012230211.29402-1-palmer@rivosinc.com>

On Wed, Oct 12, 2022 at 04:02:11PM -0700, Palmer Dabbelt wrote:
> I'm running b4 from a bash script that does all sorts of wacky stuff to
> try and talk to the Yubikey, which causes "b4 pr" to think I'm trying to
> pass it message IDs from standard in when I'm actually trying to do some
> via positional arguments.  This adds a --nostdin command-line argument
> to turn off the automatic TTY-based detection and just force positional
> arguments.

I didn't take this patch directly, because I wanted to implement this on the
global level instead of just for PR (since we do TTY detection in multiple
places). The end-result is very similar to what you need, you just have to put
the flag before the subcommand, e.g.:

    b4 --no-stdin pr [...]

Thank you for the suggestion.

-K
