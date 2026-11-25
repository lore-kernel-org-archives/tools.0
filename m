Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795574991;
	b=eKEKMGMr9Xj52T5nHjX1Vk7jV4w7xPEaB61nzvxQaRYpadVgimFCs7v410LixXS5cRBU
	 myQZfljQvornok2WQjtGlOvicsHHCNy8eUJ1joKT1r/uolz3312qSZpX4LibQXJA8bFat
	 GgthXXdpSHgY6Z6RpqVueEX1k0dMiK4JSSwn1Sg0tcZxckbKT4vP2+165l5uiA6y2DB2G
	 TYJg6CL8Q0Ni0EnCvMZ9mGvvSH0inwGNZZzanM7q54aQCS59X8LmcVDgH/O0xatH+26lV
	 SPk3mfaRqUu6cDCo1yG2lBlPBWOsj4im9B4s17Kf6rJJ86iANSg8wv0AXHwMb1ef0vQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795574991;
	h=Received:Delivered-To:Received:DMARC-Filter:X-Envelope-To:
	 DKIM-Signature:X-Envelope-To:Received:X-Mizu-Trace-ID:X-Migadu-Flow:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Fq8wjwWMVp301+EeT2h7iBI7iGZhEEE+HG/WBKMWFrY=;
	b=TiLyELB0/NI51QkexPuUw8LIymvO9bNpnnHQsUGxZJUiyNqf2dCyfrquTBHPDRjJEqpf
	 0YwcyTs2XtJN2eKgIzaN50mXd4sea15Zb3vGBP1iyRqMXLgnRjdTajBZMTqf52/S9HXvj
	 /qSWJasG9d0K2SQ0yJOTNUruaQwRQFLbjJKtsDbqnQDS295vwyiUWdQq4VmnVl0JnxsM5
	 VG6F1IS+9m0WRy68MRJlMfyGL6ua7AJTJIdAPn3tUPmvZTVuE82C482wuJFNevcU+IITw
	 VCVgJnAlGHCU7C5I4N6pdjkI0mwlsaIXAbYdAcLIxbTWtj5ZdZ+O+qkCVGz9eVBNUUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uoGKF0Kp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798ED606A31E
	for <tools@linux.kernel.org>; Wed, 25 Nov 2026 02:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uoGKF0Kp
Received: by smtp.kernel.org (Postfix)
	id 4F1FE1F000C6; Wed, 25 Nov 2026 02:49:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=95.215.58.112
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795574991;
	b=xOfzlHxyl0xILUZYoD7mZbOe1KhZ4gupByVgsXvXJfU7bQkjiEIC4sTWh5x1iKY7D71z
	 mwOfYQVZ/uN/aaJUoHKeZ3g6hwgylN95FAbl9URK9pMMrRBamvFa7r6GHT4JKkWs8kvtx
	 jxzplXkhQywqzHHHh7AjFmQtmgeQ+hlQFZfE9gBUoihAEU8rrrPzT5UFADNbvDo2POScO
	 gZjillNiBpw39SyC1YTRXOU/0TYNbYZenj9quvcQtmlG+yc6bz8pqTqDHpfiLNZRZXRUM
	 adQTy9r8YNuOt3nB0WLjXvYwC42FHC24ifJgQRoLod0fhn73XdMgGESlcNHY4FS9QGQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795574991;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Fq8wjwWMVp301+EeT2h7iBI7iGZhEEE+HG/WBKMWFrY=;
	b=d5tulAibU9tf/87MsXDa+hmDQSV6J4wQuBYIi98YlqcAnuNcsRbV5U0koLlJH3ttFBrq
	 sdSq10zXC+uaFbRmkEHTSCgbPoclYu0Hs6mFJG4TrG0gpnpR2f867hzbdSANgzdkbtzg0
	 e/pLFBl45YkOKr0dl95JckCpnoF4t6W5nN0zhBNy+9YquGS2QBoNQMdlFzGLpxEshCtxq
	 P0tpYG2GOHjEDCGMkIEty+8xCm3BBXDRUtfT56UEPrmZTUlq8gCeCvMD6hX/mwCLQRh4i
	 6/UdSmT5o3caAp0DDHmpJUOC6wDkfamL20rqrNYP6xCohvX5S/V7YByzgPQ6yQjM7iw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uoGKF0Kp;
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=95.215.58.112
Received: from mta1.migadu.com (out-112.mta1.migadu.com [95.215.58.112])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D779F1F000C4
	for <tools@kernel.org>; Wed, 25 Nov 2026 02:49:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uoGKF0Kp
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org D779F1F000C4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: tools@kernel.org
DKIM-Signature: a=rsa-sha256; bh=Vl6RwH++DT/bTHq5nx3M/g1CBsRHa8Ym6dlJzrnefDs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795574983; v=1; x=1796179783;
 b=uoGKF0KperdvPRk20zrDWjh2ebSYtpjMFCZ+rPhe9/sjKreDNNIfZB3cuv62SdypJEIHaC0D
 dvxtpacBes6REe0o4ccxIwqq2ofofecyPS1mnjlHIS7gGAKY76GKFx3PIf/mXj56vVy9p9CVWOl
 QmKHLVQj2qkpzaP80i3sSt5w=
X-Envelope-To: tools@kernel.org
Received: by mta11.migadu.com with ESMTPS id f0bdffc37e10012f;
	Wed, 25 Nov 2026 02:49:42 +0000
X-Mizu-Trace-ID: f0bdffc37e10012f
X-Migadu-Flow: FLOW_OUT
Date: Wed, 25 Nov 2026 10:49:35 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: "Kernel.org Tools" <tools@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Hangbin Liu <liuhangbin@kylinos.cn>,
	Hangbin Liu <hangbin.liu@linux.dev>
Subject: Re: [PATCH b4 0/2] Fix .mailmap identity comparisons and the
 missing-cover KeyError
Message-ID: <20261125024935.GA184281@Liu-laptop>
References: <20261020-b4_mailmap-v1-0-55965f9201bd@kylinos.cn>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-b4_mailmap-v1-0-55965f9201bd@kylinos.cn>

Hi Konstantin,

Sorry, I only sent this series to tools@kernel.org but forgot to cc you.
Would you please help review it now?

Thanks
Hangbin

On Tue, Oct 20, 2026 at 05:28:30PM +0800, Hangbin Liu wrote:
> This series closes two remaining identity/tracking problems in the ez
> prep workflow.
> 
> When a tree's .mailmap gains an alias for your own address, git log
> matches --committer against the mailmap-canonicalized identity
> (log.mailmap defaults to true), and 509f56ff5c24 already taught
> find_cover_commit() to pass --no-mailmap so the cover letter stays
> findable. Two comparisons still read the wrong identity, though: %cE
> comes back mailmap-canonicalized even with --no-mailmap, so
> `b4 prep --claim` treated a series you committed yourself as someone
> else's work and re-stamped every commit (patch 1).
> 
> Separately, get_prep_branch_as_patches() indexed tracking['series']
> without checking that any tracking was loaded at all, so any caller
> arriving without a cover letter -- `b4 prep --auto-to-cc` on a branch
> that was never prepped, or a cover older than the search's
> --since=1.year window -- died with a bare KeyError traceback instead
> of the diagnostic every other prep subcommand prints (patch 2).
> 
> Run ci.sh, all test passed except one pre-existing failure
> test_base_commit_in_remote_tree.
> 
> Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
> ---
> Hangbin Liu (2):
>       ez: use raw committer emails for identity checks and diagnostics
>       ez: exit cleanly when prep tracking data is missing
> 
>  src/b4/ez.py         | 11 ++++++++--
>  src/tests/test_ez.py | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 66 insertions(+), 2 deletions(-)
> ---
> base-commit: 6be7c6139d7734d84afddf989fa2874935b6d85b
> change-id: 20261016-b4_mailmap-e33d8ae9ca53
> 
> Best regards,
> --  
> Hangbin Liu <liuhangbin@kylinos.cn>
> 
