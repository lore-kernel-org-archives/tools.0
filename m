Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83C837E5D7
	for <tools@linux.kernel.org>; Mon, 27 Jul 2026 21:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785187614; cv=none; b=AA7Ka8vNqMqkTlpTlaE/87HBDtRAU8e9AjSw9HpIhOtI17pN4B1Kmf8rU8ujn2nA8ajNsyJzxb0x7ggUvZbZU67rQ6lWZe55jJSOWEgywV+IStfhdQyPrKJ+ejuemH5PD/zWFUm/MLFmSsqmXOUnLFo87tV9WvofhOo5JxIGQO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785187614; c=relaxed/simple;
	bh=HE2D+wdNUvy1I3sc4cqso3+yn5OZU99+De34O28Aa3w=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=DID+qShIbOjfVAPPHhe4qgN3gziy92E/eZun9uIPA0iKeV+yPSEUucYxZqWQF+sblRUMOu+Hd268usrYh0bGOzr9R2n/acwiRA6iTHrdJNE1WjHmqW2dUJ8h4KzPRwbweKPhv4dBgehdzm/rzkh26UBQav1qqQhyvXbk4fwQ6dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RjFpKEiP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RjFpKEiP"
Received: by smtp.kernel.org (Postfix)
	id 89B3D1F00A3A; Mon, 27 Jul 2026 21:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B57BA1F000E9;
	Mon, 27 Jul 2026 21:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785187613;
	bh=umS0DnT+vvw9uUmbPeaVwfTqmEhwrp2krFcw2picj68=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=RjFpKEiPXbj5wiA9Zj7tYq7Q27j0XgRiVVq8ObLXqFtF2xBQbJ5DJ0BPjSC8UvPCC
	 pPHsXezztb2TKHCMH5pYKCd1+CBliToL5r7btCzdlKmojx1ZHZb8wNGDPDiTAVWi6x
	 jPXTa8nLfKHXavRO8e4vURxc0Ihws5EKLv8Za1GA3zMssprzoOuwj/66qaNcodWCIO
	 L+c0gygi6tI+srPda5HykyXLaAeZmzUVBkDYq82zAFKHHddQx1jyHMKi8q2F11cxD6
	 4sL2DidoW8h+eg2gXNyiWg9HXsjgcl8+Ck5ygMcJ8U0ourBl9ykp4aDVe3MqUkjPAx
	 Mhj4HY+RaTz/g==
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH b4 0/2] Detect naked cover letters that lack a 0/N
 prefix and diffstat
From: Christian Brauner <brauner@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Christian Brauner <brauner@kernel.org>, 
 "Kernel.org Tools" <tools@kernel.org>
In-Reply-To: <178518050148.2787052.7066452208131813379.b4-reply@b4>
References: <20260701-work-b4-naked-cover-letter-v1-0-f651c2ffb63b@kernel.org>
 <20260727-umfahren-klinke-mutation-b23efcc7258c@brauner>
 <178518050148.2787052.7066452208131813379.b4-reply@b4>
Date: Mon, 27 Jul 2026 23:26:50 +0200
Message-Id: <20260727-entwachsen-ehrung-geowissenschaften-8629305c86b7@brauner>
X-Mailer: b4 0.16-dev-09492
X-Developer-Signature: v=1; a=openpgp-sha256; l=348; i=brauner@kernel.org;
 h=from:subject:message-id; bh=HE2D+wdNUvy1I3sc4cqso3+yn5OZU99+De34O28Aa3w=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWSln5Wp7jt6XJ73vtNt+/C/e96ISGxyZ3skMp/n/JPJQ
 tNY4tM2dpSyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAEzk+k9GhskxlqIN94rZ+Ney
 nTT3l9TVsNny73PTPcPEaOfPU2tjIhn+5/smXJy/84im3Bu7G8+urj4SVZz2Kmq741S+Uoe1VkW
 L2AE=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

> I will take this, but I will grumpily point out that it's the second 
> time today that I'm adding special handling for patch series generated 
> basically the same way as in 1999.

Believe me, if I would've seen any chance of getting said offenders to
change their ways I would've done so. But you need a reasonable
counterpart for that.

