Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DC779EF
	for <tools@linux.kernel.org>; Mon, 27 Feb 2023 19:00:05 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id d10so4154175pgt.12
        for <tools@linux.kernel.org>; Mon, 27 Feb 2023 11:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677524404;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M8fz53Nr+ncWcX93r7Be8lJsUJTepxactFeuyWvsRRA=;
        b=HHsozSFaqhVLU+YKbQ4YiqC8RslIxxkorUKRlXfGasiXvRdxb30iSmD9qzf7Gw1uWX
         9e1ZGliVylbO+XhmOeeXuJXBQNU/wn96PmUpG6bbfBuqDWVGCPnYbXY40QRHTDbjEAfF
         P19F7bp9YcCqlzUXyEvZLn9gDqDPavRHz6PzU7kfbKSu5szbSyAPydzf6MitOMgG9vCP
         Z+3M+Ava3xUsOYadYmSEw9DwBPod9btXno3AMd2VH0gssTSSAckvxWqFlyt1/8EakJBs
         VX72f5b0r45HidYVnZz68/+vdUqsMg3c+Br/7mPwZOHxjqdVURtBelHVkCCTv0AgiyFs
         r3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677524404;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8fz53Nr+ncWcX93r7Be8lJsUJTepxactFeuyWvsRRA=;
        b=OcP2rTAuzOf8f6aeM9jPW2Al9kkEhS3g645HXcHVBdcJfDShmtEDFzAu/CzlUUSLen
         D7Xt1My8EIZvkSfaLo8rxuu4rhgWPU5yYbsQJHabG+ab4NCccCi+qtKTEGNm+7VdsjpW
         TlGkyzy32wRWg5kGcBWdmoN2n3yXtqlJ+U9VsGiOJhVxrKWsN8XBRZU753tEIaQU9DQj
         UFIB9UE4KzK+OStWf4z/U8dyTEkca49XpxfwqBU2bS9AGongtE0vYfk0ZZslGsyb5YGQ
         +L0t7f40g7uv4DzNCesJn2j8Yj+uqmpT9IOCW6TTe3hV/fUgY0V9qCfw9cmQcwOsnlv8
         SaYQ==
X-Gm-Message-State: AO0yUKX+wAtnPPCeAaRqDzKKfs6niRpmn3M6PJWSdkIDwgAm7ZbYgMWN
	cDqO35Ah+gIrgpGXPOnkIw/qGTTIiVNtcxY5
X-Google-Smtp-Source: AK7set+1h1ceFHYLUclcSFgL98DGNO58ThX1Dt0XOBYtzVAnoFGlPVby48QmghxK9AAuZwS2lCs+nQ==
X-Received: by 2002:aa7:9e07:0:b0:5a8:515a:eba4 with SMTP id y7-20020aa79e07000000b005a8515aeba4mr19351pfq.10.1677524404144;
        Mon, 27 Feb 2023 11:00:04 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id q23-20020a62ae17000000b0059416691b64sm4694086pff.19.2023.02.27.11.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 11:00:03 -0800 (PST)
Date: Mon, 27 Feb 2023 11:00:03 -0800 (PST)
X-Google-Original-Date: Mon, 27 Feb 2023 10:59:15 PST (-0800)
Subject:     Re: [PATCH] shazam: Add the --add-message-id argument
In-Reply-To: <20230227184855.kkwdcweahglujppo@meerkat.local>
CC: tools@linux.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: konstantin@linuxfoundation.org
Message-ID: <mhng-285f5c62-3d67-44c8-b2d0-64c8840b3873@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Mon, 27 Feb 2023 10:48:55 PST (-0800), konstantin@linuxfoundation.org wrote:
> On Thu, Feb 16, 2023 at 08:48:41AM -0800, Palmer Dabbelt wrote:
>> Some projects (at least QEMU) want Message-ID headers instead of Link
>> headers.  I couldn't find an easy way to do that, so this just adds an
>> argument to shazam that mirrors "--add-link" but adds a MessageID
>> instead.
>
> I'd like to go a slightly different way about it. We already have a
> "b4.linkmask" parameter, so I suggest we also add "b4.linktrailer", such as
> you can specify:
>
>     [b4]
>         linktrailer = Message-ID
>         linkmask = <%s>
>
> This would additionally allow someone to differentiate Link trailers that
> point at code-review links vs. any other links.
>
> Does that sound like a potential alternative to creating another runtime flag?

IIUC I can put that in each repo's config?  In that case it's actually 
better, as I don't need to remember to type "-l" in Linux and "-I" in 
QEMU ;)
