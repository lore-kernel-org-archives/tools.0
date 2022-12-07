Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654968BF1
	for <tools@linux.kernel.org>; Wed,  7 Dec 2022 19:45:48 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id a16so1878751qtw.10
        for <tools@linux.kernel.org>; Wed, 07 Dec 2022 11:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vvnKXBoW+FVegfEkxc5A8DYNyNzJW7i7rLWvvC/tk9o=;
        b=SPvb40Fbq5s2TRLyT35aHCXMju4r5CrbLRmufvt3mwBZA5wN9belxjfERVahWBtB8W
         5jsPLYcx5Q+edm4J4VufO//6c6W3xkXrxG9labt0Fdx2Uv5y8ryFU0FrVeTC6sHabBWR
         BLEd9uwhZnaCZ31OytBhsHRdXFPAlSMBDGcDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vvnKXBoW+FVegfEkxc5A8DYNyNzJW7i7rLWvvC/tk9o=;
        b=WX9xvDHXdcSfMyZyaLkk1Hko1QjcUxJKc0kHDYl272X52nNgNpxXzxUaTkU2Giym7G
         yAr/5ElnmRQomadrlVdeQV6BMuLD4/+2Rwf9y8e1HUHMZ8I66jyDL7GD+JaVsDKVYZ5m
         Lbejd/N7cGm7vLM0DFgNTBc3aOVP9jioSP6Xv8Xz+w15hPxuEDAgWGCKFNGm03aRI/in
         9eiTpTd0h2ARgbj2N7n3AfDqSjKunrhnp6il8HgxiXUOeBY8cjQnLoxpeXQC1J2sEcgw
         1H2SfHFqT5nTbNshusLTufZaIgubLGUDBK4O+ULnybtAuV292f947/gBmIH3M4qB5f8h
         zy4w==
X-Gm-Message-State: ANoB5pkC4ucLOZLqsNzo3aQGKs8djXYt4YdTt7cqTHBldDhhFOjiS6Q3
	46VSj2NMIEPeizFyYEWo2bMm5bh3w9hU/crx
X-Google-Smtp-Source: AA0mqf752BIh8LcNTK/Ad/o1FPvF8tXyAl3hg4c+c/fPa4zgAzCEFiDQO8bpGjCxdzZHG+sN+0jXcw==
X-Received: by 2002:a05:622a:4117:b0:3a5:78a9:7a3d with SMTP id cc23-20020a05622a411700b003a578a97a3dmr1629176qtb.1.1670442347164;
        Wed, 07 Dec 2022 11:45:47 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id i11-20020a05620a248b00b006ee949b8051sm18319082qkn.51.2022.12.07.11.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 11:45:46 -0800 (PST)
Date: Wed, 7 Dec 2022 14:45:44 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: tools@linux.kernel.org
Subject: Re: new: b4 send --reflect
Message-ID: <20221207194544.ei2nkaw2lvvs7ifq@meerkat.local>
References: <20221206215340.556ov3bdfyf3qvyy@meerkat.local>
 <f8d14fd5-58e0-853d-64e0-72cc60e69629@tronnes.org>
 <20221207182156.zbwmcdckoegef6lf@meerkat.local>
 <f0394397-0cd3-72db-36c2-91ba1f98b709@tronnes.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f0394397-0cd3-72db-36c2-91ba1f98b709@tronnes.org>

On Wed, Dec 07, 2022 at 08:36:44PM +0100, Noralf Trønnes wrote:
> > On Wed, Dec 07, 2022 at 05:39:40PM +0100, Noralf Trønnes wrote:
> >> Error from endpoint: This service only accepts patches
> > 
> > Stupidly, I never tested it with a single patch, always with a series.
> > Please try again.
> > 
> 
> Getting closer ;)

You're tripping up all the corner-cases, this is great! :)

> Reflecting via web endpoint https://lkml.kernel.org/_b4_submit
> Error from endpoint: Destinations must include a mailing list we recognize.

One of my goals is to make sure that this service can't be abused to send
spam, so we're running a bunch of checks to verify that it's a legitimate
patch sent to a sane set of destinations. In this particular case, we weren't
expecting the only list to be lists.freedesktop.org (usually there's always a
kernel.org address there somewhere).

Please try again.

-K
