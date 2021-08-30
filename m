Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A169272;
	Mon, 30 Aug 2021 17:47:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5AA0A60E77;
	Mon, 30 Aug 2021 17:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630345667;
	bh=tJEA960DalI5QuQe5voRXBYz4aOtsxjFgzf5US+mCN4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oiAK8jHlWboQpELGqnwc58wwvLTre/A3UmC6mrpF7PH2HjvoDevWxmEbpJKEEvda4
	 WUWW+BWMN8GKrLY65WIVU519t+HzkXBtHMsCyE9S03iGon+eG3UlDf3xisAu/4R7J7
	 W0v1KprzCVJNKiPadILHAJuTXe0mMU0a3zLp9KH1igBj7JfXk50IFm4DVxDR2vzAif
	 1BbP3ygYQbPqw4bpreYQSsk1/0+0lqWzR7GGjYdJJE8vASADDh4ytq7HBJ74ttnmuW
	 iWqxoXa5gg9y/GRgrhDvd+BLtrXrvseNnyPtKkyVsTS7LQTfZiB5GVzdX357kIlLVG
	 udDgIp42m3kXg==
Received: by mail-ed1-f49.google.com with SMTP id q3so22829845edt.5;
        Mon, 30 Aug 2021 10:47:47 -0700 (PDT)
X-Gm-Message-State: AOAM532DmOUFWRRYDiLrX9P+fc6zpb1g6tP7lM4tS2BmlrzOCEIfs9u6
	N6C4e2r3UNyaAcQpQyFobpT5hPmopgv75bKkmw==
X-Google-Smtp-Source: ABdhPJz2vUji07q4Zjc170YS8hA8zuvjYI6bq2t7j3VGJMTTnKfTMzLcOl72mCvsWLaYIAXPjaEKGIh/4slVzfaiIHQ=
X-Received: by 2002:a05:6402:70c:: with SMTP id w12mr25763113edx.289.1630345665960;
 Mon, 30 Aug 2021 10:47:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20210830164626.tq5emfrht4o46x33@nitro.local>
In-Reply-To: <20210830164626.tq5emfrht4o46x33@nitro.local>
From: Rob Herring <robh@kernel.org>
Date: Mon, 30 Aug 2021 12:47:33 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL3+HmAReo9PTLW4Y1o_NiR6oZrV+FC+msGu+epkAJ02g@mail.gmail.com>
Message-ID: <CAL_JsqL3+HmAReo9PTLW4Y1o_NiR6oZrV+FC+msGu+epkAJ02g@mail.gmail.com>
Subject: Re: lore.kernel.org upgrade: Sep 1, 2021
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 30, 2021 at 11:46 AM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> Hi, all:
>
> My tests of the new lore.kernel.org service (currently running on
> x-lore.kernel.org) are looking good, so I will be putting that into production
> on Wednesday, September 1, 2021.

One thing I've noticed doing some searches[1] is I get a bunch of hits
on post-receive-hook mails dominating the results which doesn't seem
too useful. Do those need to be in the 'all' index? The purpose of
them is pretty orthogonal to development patches and discussions. Or
is it possible to have an 'almost-all' index? Or other flavors of
indexes in general? Perhaps a patches only index for example (the best
I found for a query is 'dfn:/', but that has some false positives).

There's also a ton of stable review patches, but that's not a new
thing as those are cross posted. While I can filter both of those
out[2], having to do that doesn't seem like the greatest default
behaviour.

Rob

[1] https://x-lore.kernel.org/all/?q=rseq+arm64+perf
[2] https://x-lore.kernel.org/all/?q=rseq+arm64+perf+-l%3Astable+-f%3Adevnull%40kernel.org
