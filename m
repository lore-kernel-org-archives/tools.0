Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AC74317D
	for <tools@linux.kernel.org>; Tue, 24 Feb 2026 22:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771973302; cv=none; b=Q23IUccNDecTZbM+fWziNTGjLTGYRDLNZg3olxYWRoO/YDKz44gUo5lswtAOyjmTU8gN6nJq4qFLzPGINLYrqmQSz94bCUkfD6NWKIIVqU9BTN5APefGZcp6gbA57aENMr4ERdWrviv1BUeOCTlCVmfzGymn08M9gtd7ahtgFf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771973302; c=relaxed/simple;
	bh=Rd6JDa8LDe2eAVeOZdPfB3EGkepZGMR3F8smi/+ThxM=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Q88Be8WOXb5nTiAcZ5QJBxwJkmzK30IrFM7i2t6xicmyw3qtGn5JTBHhskhZyap7ICroqaa7dO4ROwq10UhDwHaYpot1e47iwgVCtCNY9UU0ooez/N2lQULl3QYuRe0q3hmOK7Ka1EWohoT59umCk+CwyQVPQTdIj5AoD5TXaVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qggCjo05; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qggCjo05"
Received: by smtp.kernel.org (Postfix)
	id 5A28DC19424; Tue, 24 Feb 2026 22:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46D7C116D0;
	Tue, 24 Feb 2026 22:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771973302;
	bh=Rd6JDa8LDe2eAVeOZdPfB3EGkepZGMR3F8smi/+ThxM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=qggCjo05Kp2k+C1Hq9VU2Ki5blc6JgITMXe/LsjugNqVPxAkVU1cmLCPdsk8viPKJ
	 y3NqoOkDiQ6/21jl69XIEeEr5EYNuqQ1LWLgoxKyuYmm+27LrAWf8wWL6fJZTPc8Hg
	 Qufu7rSvAUD5eZ5cHaTDwR03B9FxlstkIXj8BaMs=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
In-Reply-To: <20260129100727.950475-2-u.kleine-koenig@baylibre.com>
References: <20260129100727.950475-2-u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH wotmate] gpg_run_command: Set output charset to utf-8
Message-Id: <177197329793.4096808.9794368938787949318.b4-ty@linuxfoundation.org>
Date: Tue, 24 Feb 2026 17:48:17 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-4ab14


On Thu, 29 Jan 2026 11:07:22 +0100, Uwe Kleine-König wrote:
> gpg_run_command: Set output charset to utf-8

Applied, thanks!

[1/1] gpg_run_command: Set output charset to utf-8
      commit: b417eeaf41bcf062b4e233060c6e54d39bc582c9

Best regards,
-- 
KR


