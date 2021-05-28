Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340AB70
	for <tools@linux.kernel.org>; Fri, 28 May 2021 12:57:50 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id i67so3951699qkc.4
        for <tools@linux.kernel.org>; Fri, 28 May 2021 05:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=o86Sw9NlihERQdCSgJ+8Poq2lzfP+gMHCpEwfImQFmw=;
        b=iNC3Wwtd+UFAteMyy8y2Uy0m87ZATnju1D3DEvmNEbUy1Okl/97wfgp63yf+IS6tuS
         8pmBHulPKM5D/+0wlXKUxovNwVXV+XoQpiHvSnOvjXGoK4HwSN7wbQAGPgwiH6ul1jkR
         sxEn9r5vp89+KxvMkCwUnOiRgn9LlUGRHduNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=o86Sw9NlihERQdCSgJ+8Poq2lzfP+gMHCpEwfImQFmw=;
        b=fQ/ZnwlVE9cXJWGwYuikP+CcKV86C3FsxsM/WmwolSO7Ilc1JJ14T1AX64DGgA+owX
         0jJBWOdM6E7KZwXmhccoIAfnEKqYYQcdKH+zcopdzUs1/O4/lUcPgOsCdSsuMfTvOfzx
         ei1G6BMF8EpVN3QeUZwoD+bTJb3Rl7IAUQdFBrqugCnre+6VVN8IwNjPb8GoHychYeMg
         elMCBAE/UScZD0QBF7p6CB1ZcAz1d2dlrlgvrpwCaAmqjRLWHU+KjI4wVl/+iJh26HB6
         i3KR71UWr4+oLxJ/i2o4fNOrrAE31X92Z0Ez1OcGMVa+buLSr9UJ9u7dr8rGxySKcWZ7
         1vzA==
X-Gm-Message-State: AOAM533Q66kShK3Jh6qMFMoIvh9VoR7yt5LRaXLV6cH5BUFZcz0zq6L0
	NpmrWBooIUvVwsNIV/XuCXBz1gXBllvHjLaaxyM=
X-Google-Smtp-Source: ABdhPJy6lyZH2Fs8L72AVmDrBdvxW8vb98PBVsQJFhuq9yia+T2YHsOhzRTbjA5pExe+bZU02zI4Mg==
X-Received: by 2002:a05:620a:704:: with SMTP id 4mr3722507qkc.66.1622206668999;
        Fri, 28 May 2021 05:57:48 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id k124sm3311211qkc.132.2021.05.28.05.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 05:57:48 -0700 (PDT)
Date: Fri, 28 May 2021 08:57:47 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, Kyle Meyer <kyle@kyleam.com>
Subject: Re: [PATCH b4] Limit 'From mboxrd@z' replacement to start of message
Message-ID: <162220659596.512204.6134246172288158737.b4-ty@linuxfoundation.org>
References: <20210528042635.24959-1-kyle@kyleam.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210528042635.24959-1-kyle@kyleam.com>

On Fri, 28 May 2021 00:26:35 -0400, Kyle Meyer wrote:
> save_git_am_mbox() replaces 'From mboxrd@z ' with 'From git@z ' to
> make it clear that the output format is not mboxrd.  However, all
> occurrences in the message are replaced, corrupting patches that
> contain 'From mboxrd@z '.  Restrict the replacement to the first line
> of the message.

Applied, thanks!

[1/1] Limit 'From mboxrd@z' replacement to start of message
      commit: 74c8e095354e5401a4fc02259f7871c40392b690

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
