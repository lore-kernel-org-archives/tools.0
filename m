Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989D033F9
	for <tools@linux.kernel.org>; Thu, 24 Nov 2022 20:24:40 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id h16so1553413qtu.2
        for <tools@linux.kernel.org>; Thu, 24 Nov 2022 12:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Vsrh3Q6ZM/3/2iL9/N7nAKbuAyDgUrPTkxrB9JZVrU=;
        b=U3w+7GbJw2dRj9w8KSCQXqwnW2uXwE8dms0vnkS7ppRUORhDPA/dSit4hLrnIjPY9m
         Z3y4D4C09upLPGAT91aPjp0Nv2EunoDbMV/14akogHFlcS0o+xAo/oaU61kIzTQdWZ4d
         L6YtfdSthmyGAsIcdOIPoYwX4QVnBUiNJi7to=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Vsrh3Q6ZM/3/2iL9/N7nAKbuAyDgUrPTkxrB9JZVrU=;
        b=VitD7MjUfgMcIkUG4+77GKolWQk/fzUKm64wau3tjwenB/AKcn14GOPEN4Yxs6GgDM
         hSqxqQVXfN68oCnxaRrO6prQOW1vZvmsM9hsNAAyOEdMPJWntHFVTgcvP4Vz1AV1OTrG
         Epggq/JwDQCTRVslV5MTEAn69mdVtEFS7oZn7C0owlwyzATIfZ9YyCxLVSO6PeEHQGYZ
         pLisItMwdwPZZemBRY7tLpVU2PcAoERha8ILd7jl3/CPVjEGxWXar5k5Yk0hRG3OxHTg
         cqLkiEp74mnS3gbPoI5hKpczOfGthPXFAS3VGaBN4cjTgXxLAHeRDqCS5DtCmy4rBrpz
         DsfA==
X-Gm-Message-State: ANoB5pnX9WPF2BJo3l1jJXnQ9pC1QzDtIbXL6eO4S28WxIU7GwRmTKxM
	RRGEe7e8LRXRM8T8TbGBopG3rA==
X-Google-Smtp-Source: AA0mqf4f57KrCFGbPw2Vl7GQXmF2S8H7klyg8mXoUmLITEe51Y37g9/Tb/lvweECG3Ss8E4BFnycEg==
X-Received: by 2002:ac8:7492:0:b0:3a5:425b:f865 with SMTP id v18-20020ac87492000000b003a5425bf865mr17452918qtq.589.1669321479491;
        Thu, 24 Nov 2022 12:24:39 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id bj12-20020a05620a190c00b006cfc1d827cbsm1474011qkb.9.2022.11.24.12.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 12:24:39 -0800 (PST)
Date: Thu, 24 Nov 2022 15:24:37 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: tools@linux.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: b4 prep/send: single patch mode
Message-ID: <20221124202437.td63ug6zmbeka4xj@meerkat.local>
References: <CANiDSCs-_bM6kC0cYTCRjCha3n0QVhbC+tTt=N9G4QPwgq3s+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCs-_bM6kC0cYTCRjCha3n0QVhbC+tTt=N9G4QPwgq3s+g@mail.gmail.com>

On Thu, Nov 24, 2022 at 06:49:34PM +0100, Ricardo Ribalda wrote:
> Hi
> 
> I have moved all my developer workflow to b4 and I am super happy,
> thanks for that :)

Excellent!

> There is one caveat though ;):
> 
> When I have to send a patchset with only one patch it seems redundant
> to send a cover letter, Most of the time, it is a copy of the commit
> message at 1/1 plus a link to the previous version of the patch in
> lore.
> 
> Would it make sense to add that info after the --- and do not send the
> cover-letter if there is only one patch on the set?

This has been possible since commit 6c215d83473d732cf1208c17a00a8ebc7d7526eb
-- you should update to the latest master (or at least to the latest
stable-0.10.y).

-K
