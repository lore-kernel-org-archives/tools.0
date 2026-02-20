Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2DF2765F5
	for <tools@linux.kernel.org>; Fri, 20 Feb 2026 17:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771607040; cv=none; b=HQEwmc5zTuv/BwlATdbanzXQF4qzBtyVuHuQuMHFzf+IDGD85IjhNM+ciB+l8mH5fnsIvzrRCzaDBpIxODCzxHlHxmQT3BaZiL+ZX298l3jPeD9TD93T+dDiiJCcMzbi+eGPrSEvB5we7NmayDpDBpsXjJXxWio0LkP0Ip281aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771607040; c=relaxed/simple;
	bh=tfz74gxu8Aa/QGyseURkzORiBpPpVMig8qnCzrBfqNk=;
	h=MIME-Version:Date:From:To:Message-Id:Subject:Content-Type; b=hFJ08yds94S9xanVRp2D/HOF/fq+LaLYYrP6UgZIPwBmeJXixUvB93q6g9rCBlsch5VNGKwgqBW2VBzv53Orhe7T+oYq1MBzo1t18Sd+tC+89eIGPCH/P4n+Ua3bRt9m3hNCkOc6hgasi94118rEi9NPvdfda8MU6TAZ1ESAbsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IS6hkuHD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IS6hkuHD"
Received: by smtp.kernel.org (Postfix)
	id 94CAEC19424; Fri, 20 Feb 2026 17:04:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658C1C19421
	for <tools@kernel.org>; Fri, 20 Feb 2026 17:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771607040;
	bh=tfz74gxu8Aa/QGyseURkzORiBpPpVMig8qnCzrBfqNk=;
	h=Date:From:To:Subject:From;
	b=IS6hkuHDXTOeq97cN7kF7g5QCniV2ZvyLE1o6ajZOPpVAqrChVPcp5OTMrb/6md9b
	 o00qsipQtd42OVbuABKxSg75NQKa0AqLPrvYS2z+7lkfBc9iL8JzUwgIHjzdwfG5pH
	 AUd/LZsY29iS3m/c1e23b2YuRA1rQd2Hewl0LxY+M7YGtRVzxMHZ4fkBl4NnscsjnD
	 EPgf/zsELBYqSpposFJRdCdASMdUM9adsAbkjbHeOuq8AfOb8kzVzuSnfHSEpSusT8
	 TikhHGhrQI8wizWQ4JRe/93RgIpU9yemSC3N/Fw/EMicKrFQXxM4gmwGz549ex4tjJ
	 QLpORTo54VKyg==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3BA32F4006A
	for <tools@kernel.org>; Fri, 20 Feb 2026 12:03:59 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Fri, 20 Feb 2026 12:03:59 -0500
X-ME-Sender: <xms:_5OYaULpDBzYkj6yEc5rq8CX9a9uKNsPltDxfzp6MyIE7przjPh7Lw>
    <xme:_5OYae9wd6v6PjSTfKvV2VZGqQMt15izZU5NFpqllHsfFghDNCzIKnEAct4eC82Lm
    XJ6pckm9gIWQb1kysrVAh_CIt1l1jsLuV80Q2hMMB7VmxJPdKWi3FAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvvdekleelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefoggffhffvkffutgfgsehtjeertdertd
    dtnecuhfhrohhmpedftehrugcuuehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhn
    vghlrdhorhhgqeenucggtffrrghtthgvrhhnpefgieetieehleetvefhiedvkedtheeiie
    dvvdeikeelledtudfhveeggfeuueehheenucffohhmrghinhepkhgvrhhnvghlrdhorhhg
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrug
    domhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeijedthedttdejledqfeef
    vdduieegudehqdgrrhgusgeppehkvghrnhgvlhdrohhrghesfihorhhkohhfrghrugdrtg
    homhdpnhgspghrtghpthhtohepuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    thhoohhlsheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:_5OYaZvacUMUDZY2eEMouXio9m6SuardO1aLvTcBFmaz1_syHoeFvw>
    <xmx:_5OYaZZqZZkHbkJRuI-ke8Fvjnmsz1Io5EYlrcHrxxke8AzWY9-isQ>
    <xmx:_5OYaSaRW0AzcS9OglP57M46cANkK6bdYzMfF_gf_vGNEeN3NY_HNA>
    <xmx:_5OYaVVy4tbebgONRmCEoMvCLhKaz85fCWB3nxE3ZCsdtw2QglNh3Q>
    <xmx:_5OYaZ0BpK7uXVaOVdepShocCJ9_Wjd70FZwYNXuUQaCG0t9VipOmW4W>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1E90F70006B; Fri, 20 Feb 2026 12:03:59 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Date: Fri, 20 Feb 2026 18:03:12 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: tools@kernel.org
Message-Id: <5232d291-747a-441a-a4a9-f518352b70c3@app.fastmail.com>
Subject: korgalore chokes on rm commits
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Reattempting delivery  [------------------------------------]  0/1
Traceback (most recent call last):
  File "/home/ardb/korgalore/src/korgalore/cli.py", line 567, in deliver_commit
    raw_message = feed.get_message_at_commit(epoch, commit)
  File "/home/ardb/korgalore/src/korgalore/pi_feed.py", line 357, in get_message_at_commit
    raise StateError(f"Commit {commitish} does not have a message file.")
korgalore.StateError: Commit 57b7006b98f00912504ce02ee9fdfd673d18cb79 does not have a message file.

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/ardb/korgalore/src/korgalore/pi_feed.py", line 373, in get_subject_at_commit
    return COMMIT_SUBJECT_CACHE[commitish]
           ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^
KeyError: '57b7006b98f00912504ce02ee9fdfd673d18cb79'


commit 57b7006b98f00912504ce02ee9fdfd673d18cb79
Author: linux-crypto.vger.kernel.org <linux-crypto@vger.kernel.org>
Date:   Mon Feb 9 20:28:44 2026 +0000

    rm

