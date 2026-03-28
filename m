Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B72378838
	for <tools@linux.kernel.org>; Sat, 28 Mar 2026 17:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774720548; cv=none; b=O+yqWtEvemQ2twzeRntyBvj8qu2/310Fjpw/AgSQIXnzWZl2wskjqTAqLXTlZRxhzrC+3SjIl/fp4pshsty4ma7VCGIQ0L1ubM261VC8UexOBRsRkHC4CvdqVMTBKlYVHtEmNlYCGFL8bShSoGUJxNo4y42zM/4EdXR0dCpZDCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774720548; c=relaxed/simple;
	bh=kO4PKBo0ozMbnTpZbjnuYxIqflU4p41yfkMm4xbUhsw=;
	h=MIME-Version:Date:From:To:Message-Id:Subject:Content-Type; b=Z5D4sb9MtzHf9ZM4pQTse788YVV+M6eiew+dxx9+6gs4W1Rl9DKPayfUbRQxlI8us03r6SRb5f+HDHSU5/n8m85fu56/xbC3yjyKvPxwmKDa2hkmEB3Y9KiHwI68SDQ2KAEalSu1WudZNKN+AemGgwIXhLknSD/HGbYG4BmEh6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T5XaVOwa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T5XaVOwa"
Received: by smtp.kernel.org (Postfix)
	id D2B6BC2BC87; Sat, 28 Mar 2026 17:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97FD2C4CEF7
	for <tools@kernel.org>; Sat, 28 Mar 2026 17:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774720547;
	bh=kO4PKBo0ozMbnTpZbjnuYxIqflU4p41yfkMm4xbUhsw=;
	h=Date:From:To:Subject:From;
	b=T5XaVOwaOoNczk5z90Jn6dIJEx/DR5feoD/7w9tb8fOc5ASCNkaGpGkuMdMC+yKid
	 accZh0E4PLtR3mRPvfARYJbSLXznXUB+C3OgSeUAmG/hkr6m5X6SGklhGXXCbqDzLu
	 CNQgJPNTkqc+eOzYqjOJ9PWyC3oJqv38xcpeXsahRU76udScosi2IONIKKF76nkp5l
	 KV9DIQ/aCb9vRal4JG8K3GNPjNFCHjZNz3wch4KMxHB2WjNhhuE357i8caKrQBe4Q6
	 ZAhVWDIiOgNGuVh1aMfhvEg0KzwBGfPVL7tVeh1+7mqBAWq4ZuUqaJWaer8nhfsvgD
	 MBoaS0aalycmg==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6FDBBF4006A
	for <tools@kernel.org>; Sat, 28 Mar 2026 13:55:46 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Sat, 28 Mar 2026 13:55:46 -0400
X-ME-Sender: <xms:IhbIaTt5nikmmqNt9xdMkJ9Z_QGD5irwP_d8Q-I35b4oI2WFMcyWGQ>
    <xme:IhbIafRzV-FrxIAo-a5_UNV936I-82SZi7faCiaO0sN52gixfoZOUZPtEnu053kue
    b6dQqxI6qAX4mWQofOaKB7jZGstPrAPyrTIrEpG-1CHHokfxuCW3iA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeffeefkeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefoggffhffvkffutgfgsehtjeertdertd
    dtnecuhfhrohhmpedftehrugcuuehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhn
    vghlrdhorhhgqeenucggtffrrghtthgvrhhnpeejtdetieefffelteejtdduffdtteffte
    evgeejfeefgfeutdegfffhffeuffeitdenucffohhmrghinhepihhnshhiuggvrdhlohgt
    rghlnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeijedthedttdejledq
    feefvdduieegudehqdgrrhgusgeppehkvghrnhgvlhdrohhrghesfihorhhkohhfrghrug
    drtghomhdpnhgspghrtghpthhtohepuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepthhoohhlsheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:IhbIabQQnuGoSsAOUODUotNpAaMNQaDMC015R-w08c4smn13sbCLCg>
    <xmx:IhbIaTvp3jf7shH_LaBI_9_AkK-u2wRTVNpyxLYADXbQQD71nUC-DQ>
    <xmx:IhbIaWe7-rfCTbOmDP2miD0maLvuRDmjidHWY_1vhgNLYeTC0qFg9w>
    <xmx:IhbIaQLWiRf1Wf_aQfiDUXh6gpohxkFE0Krj2LaTziBBvS0682HTYA>
    <xmx:IhbIaUbg8oKkVMV0TSLwg6IGqCI4maR0qAKV9smo0GRNUiziscqGzIGl>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 442F2700065; Sat, 28 Mar 2026 13:55:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Date: Sat, 28 Mar 2026 18:53:44 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: tools@kernel.org
Message-Id: <c4de9f25-0c60-49e4-925f-7749eba57264@app.fastmail.com>
Subject: another korgalore issue with linux-crypto
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Konstantin,

Not sure whether this happened because my local fork was in a funny state, but I got the following issue related to a 'rm' commit.

Fetching the 'bad object' commit manually inside ~/.local/share/korgalore/linux-crypto/git/0.git got things working again.



Traceback (most recent call last):
  File "/home/ardb/korgalore/src/korgalore/cli.py", line 2434, in <module>
    main()
    ~~~~^^
  File "/home/ardb/korgalore/venv/lib/python3.13/site-packages/click/core.py", line 1485, in __call__
    return self.main(*args, **kwargs)
           ~~~~~~~~~^^^^^^^^^^^^^^^^^
  File "/home/ardb/korgalore/venv/lib/python3.13/site-packages/click/core.py", line 1406, in main
    rv = self.invoke(ctx)
  File "/home/ardb/korgalore/venv/lib/python3.13/site-packages/click/core.py", line 1873, in invoke
    return _process_result(sub_ctx.command.invoke(sub_ctx))
                           ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^
  File "/home/ardb/korgalore/venv/lib/python3.13/site-packages/click/core.py", line 1269, in invoke
    return ctx.invoke(self.callback, **ctx.params)
           ~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/ardb/korgalore/venv/lib/python3.13/site-packages/click/core.py", line 824, in invoke
    return callback(*args, **kwargs)
  File "/home/ardb/korgalore/venv/lib/python3.13/site-packages/click/decorators.py", line 34, in new_func
    return f(get_current_context(), *args, **kwargs)
  File "/home/ardb/korgalore/src/korgalore/cli.py", line 1285, in pull
    changes, _ = perform_pull(ctx, no_update, force, delivery_name)
                 ~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/ardb/korgalore/src/korgalore/cli.py", line 1160, in perform_pull
    retry_all_failed_deliveries(ctx)
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^
  File "/home/ardb/korgalore/src/korgalore/cli.py", line 898, in retry_all_failed_deliveries
    deliver_commit(delivery_name, target, feed, epoch, commit, labels,
    ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                   was_failing=True, bozofilter=bozo_set, subfolder=subfolder)
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/ardb/korgalore/src/korgalore/cli.py", line 580, in deliver_commit
    feed.mark_successful_delivery(delivery_name, epoch, commit)
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/ardb/korgalore/src/korgalore/pi_feed.py", line 500, in mark_successful_delivery
    self.save_delivery_info(delivery_name, epoch, commit_hash, message=message)
    ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/ardb/korgalore/src/korgalore/pi_feed.py", line 569, in save_delivery_info
    raise GitError(f"Git show failed (exit {retcode}): {error.decode()}")
korgalore.GitError: Git show failed (exit 128): fatal: bad object 57b7006b98f00912504ce02ee9fdfd673d18cb79
