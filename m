Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EA763E
	for <tools@linux.kernel.org>; Mon, 21 Mar 2022 16:41:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29A7BC340F0
	for <tools@linux.kernel.org>; Mon, 21 Mar 2022 16:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647880893;
	bh=FLOg2MjfUaQcPyQM7INWjAe1gjvn8LouKx2fSsYorl8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IVwQzMs//3hmRO8FTpBtciwkTkoIuOGxBC6W41u/jqkhBp6bkAhgBHvYkCyom2DLz
	 WlgZ8ArN8Ron+3Ag3MquFehjOiEw8pShmBx5Iw4SBJAXa8rKSWmuLAVqIw+J9dtAkL
	 QwId60Zdh/qxSJkXfNh+K4FWgSHXOHO3rxO8fqe5s5fsgAEShsjFSu4hePcNUYYiP+
	 c5VHqxWBEhz8rOfZ49z0DS3QgZpOo+OTspcCRgxa8v8B0kyOZxWau4iuDXLk5pycEn
	 fvO244MBRPrT2oaWDopiZCbBDHdH3I48Wik12rJ5ZNGWbm+S8U+jmYOzP81H/TmMxN
	 zlAtNyhb8qW8g==
Received: by mail-ed1-f50.google.com with SMTP id a17so17519892edm.9
        for <tools@linux.kernel.org>; Mon, 21 Mar 2022 09:41:33 -0700 (PDT)
X-Gm-Message-State: AOAM533mu6pNCRW+uQDPR0LZ2fAi/VRgTtrL3T4UL2TD1tPHIjMCoq9H
	GegZ5VOmOILLvuuPt3jO05OcUZrC9w/EQdWJcw==
X-Google-Smtp-Source: ABdhPJzGRL0dN1JkrzG7ts5Y69opTJgsjE6X+Q3p+MunDUj0Vx1gnLKPU2ik1YR5eUBH+//QH9bm7fFcqgOXpnRXllk=
X-Received: by 2002:a05:6402:42c6:b0:419:276a:dded with SMTP id
 i6-20020a05640242c600b00419276addedmr11154235edc.2.1647880891364; Mon, 21 Mar
 2022 09:41:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20220225031135.4136158-1-robh@kernel.org>
In-Reply-To: <20220225031135.4136158-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 21 Mar 2022 11:41:20 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJrXXtGG52s6nzwLaCi48OutGbyGxEQEdmPZCZofNShfA@mail.gmail.com>
Message-ID: <CAL_JsqJrXXtGG52s6nzwLaCi48OutGbyGxEQEdmPZCZofNShfA@mail.gmail.com>
Subject: Re: [PATCH] Remove URL redirect project lookup
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 24, 2022 at 9:11 PM Rob Herring <robh@kernel.org> wrote:
>
> Now that lore indexes all messages, there's no need to lookup the project
> for the message-id. If the project is not specified, then 'all' is used.
>
> The primary benefit of this change is that cached accesses can now work
> offline instead of splatting with a network error.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>
> My usecase is twofold. First I want to speed up opening a thread by
> having it fetched in the background and cached. Second, I want to be
> able to work offline by fetching a list of threads (my PW queue) in
> advance and using the offline copy. With a sufficiently long cache
> timeout, the cache works perfectly for this use. Though maybe a 'use the
> cache if there's a network failure' mode is needed instead of always
> timing out the cache.
>
> I also have this working using b4 to fetch my queue to an mbox and
> then using the 'use local mbox' option. This mostly works except for
> the handling of 'From ' in message bodies which is problematic for mbox
> format. The cache manages to avoid this problem.
>
> Rob
>
>  b4/__init__.py | 23 +++++++----------------
>  1 file changed, 7 insertions(+), 16 deletions(-)

Ping!

>
> diff --git a/b4/__init__.py b/b4/__init__.py
> index 0d506bbaa649..ec1a6da44144 100644
> --- a/b4/__init__.py
> +++ b/b4/__init__.py
> @@ -2235,6 +2235,9 @@ def get_pi_thread_by_url(t_mbx_url, nocache=False):
>          logger.critical('Grabbing thread from %s', t_mbx_url.split('://')[1])
>          session = get_requests_session()
>          resp = session.get(t_mbx_url)
> +        if resp.status_code == 404:
> +            logger.critical('That message-id is not known.')
> +            return None
>          if resp.status_code != 200:
>              logger.critical('Server returned an error: %s', resp.status_code)
>              return None
> @@ -2263,22 +2266,10 @@ def get_pi_thread_by_url(t_mbx_url, nocache=False):
>  def get_pi_thread_by_msgid(msgid, useproject=None, nocache=False, onlymsgids: Optional[set] = None):
>      qmsgid = urllib.parse.quote_plus(msgid)
>      config = get_main_config()
> -    # Grab the head from lore, to see where we are redirected
> -    midmask = config['midmask'] % qmsgid
> -    loc = urllib.parse.urlparse(midmask)
> -    if useproject:
> -        projurl = '%s://%s/%s' % (loc.scheme, loc.netloc, useproject)
> -    else:
> -        logger.info('Looking up %s', midmask)
> -        session = get_requests_session()
> -        resp = session.head(midmask)
> -        if resp.status_code < 300 or resp.status_code > 400:
> -            logger.critical('That message-id is not known.')
> -            return None
> -        # Pop msgid from the end of the redirect
> -        chunks = resp.headers['Location'].rstrip('/').split('/')
> -        projurl = '/'.join(chunks[:-1])
> -        resp.close()
> +    loc = urllib.parse.urlparse(config['midmask'])
> +    if not useproject:
> +        useproject = 'all'
> +    projurl = '%s://%s/%s' % (loc.scheme, loc.netloc, useproject)
>      t_mbx_url = '%s/%s/t.mbox.gz' % (projurl, qmsgid)
>      logger.debug('t_mbx_url=%s', t_mbx_url)
>
> --
> 2.32.0
>
