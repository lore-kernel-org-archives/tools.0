Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49AD5FDA7
	for <tools@linux.kernel.org>; Sat, 28 Feb 2026 21:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772314180; cv=none; b=XHllFBjwjjQ9yaEUVAwG9JTzStshw940zxM77wK/EWOI79J+Wu+CSO0b6g9oS43D66PiObmS7YrezxAgHO7e5i/QNYSsfghmqdvzYXWv2bHYi6RxhXzQGW0d9rgviI8xxIsgChhoQ7MNt3hpKkLIxauhw2qclDJKBUOhXJ+D1ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772314180; c=relaxed/simple;
	bh=FPZbySKyvWAEZinn7kF1WNHgYqtOw+W7jxK+m6LvbXs=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=rOcyjftjwSLpNp4bhFpmwP5rdapnfsV04qBSLLGmLEFHtF5KBkJTSpuaiGktWcpONMd0JmiBkPVFkpG5E172wGI+MgNfrnRp9+lsTf1S7Di5QNzI93c9J5nB3GkOdpjbxdW9dTPCdSvmEjxM1VfYwY9/E6DwE+5VN/GTRCg8LhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 95DB3C19423; Sat, 28 Feb 2026 21:29:40 +0000 (UTC)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5A914C116D0
	for <tools@kernel.org>; Sat, 28 Feb 2026 21:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5A914C116D0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=n0toose.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=n0toose.net
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fNdcp0p9Lz9tmp
	for <tools@kernel.org>; Sat, 28 Feb 2026 22:29:30 +0100 (CET)
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of git@n0toose.net designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=git@n0toose.net
Date: Sat, 28 Feb 2026 22:29:29 +0100 (CET)
From: git@n0toose.net
To: "tools@kernel.org" <tools@kernel.org>
Message-ID: <997706185.418493.1772314169554@app.mailbox.org>
Subject: b4 sanitizes quotation marks out of my name
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Rspamd-Queue-Id: 4fNdcp0p9Lz9tmp

Hi,

I was sent here from #kernelnewbies and told that I should share my problem here. I normally sign my commits with the following name: Panagiotis "Ivory" Vasilopoulos (and it's shown like that in the `git log`)

It looks like this in my .gitconfig:

```
[user]
	email = git@n0toose.net
	name = Panagiotis \"Ivory\" Vasilopoulos
```

Although the From: header presents this as shown above, the quotation marks are removed from the `Cc:` and trailers like `Signed-off-by:`. This is not a problem when using `Panagiotis 'Ivory' Vasilopoulos`. Is there a workaround or anything that I can do for this?

Best,
Panagiotis "Ivory" Vasilopoulos (n0toose)
