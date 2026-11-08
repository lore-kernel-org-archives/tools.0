Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794144404;
	b=SFQeQkYPP4Pfe8kJtI8eDcijtESMPfAXGHR9hHMkxOxX7oP3HQ1I/Qq9308l2obuEr7+
	 vwD/KaPv1VdsLtkbaUQbBaoEl5w93qZ9eUmNVefE2q6knaOrGl/Pn1WGP7EkoVH8+jymL
	 UZoVucWCSwQ3Thr8Zw3LQlwGbY7XZHevJVosjAfvTRdX4zcgnFGHpMbI2gLTLUpUQFdyt
	 87H5QEseimGDCZERO7Ouz4p3iENHn7Hh7YtnUJNPKv2PNf0N551MCEzz2i64aILUCFhCY
	 uw9BFIJw10HbiImy9lyirANOwHgzi2LHSN5WH47QWJ7SSOxRPpoAiYLhl/Q4Y0JNN2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794144404;
	h=Received:Delivered-To:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Content-Language:From:To:Cc:Subject:
	 Content-Type:Content-Transfer-Encoding;
	bh=ZTnB61HndBw7vwZbxS/0h0+01nyo+oE9VvOndhhbHKQ=;
	b=48NIzRN6zty7UPEhrJDzsdI1gUK0kITFhUtltRxJFpJUDdgbEQ89DtpG1QBHjeQHyLTY
	 kMFywZDaPSCGQp+Vc7y2YFzwubOHr1n5qVUSRwHx8beaGwAwqZeMIKcka1GCgkv+wMJLU
	 1wD2im5KNcBJszhVkFaNvvCrWNTGOyRJTw+cY3axNzx9cGi/JCUwSKudyLIKONfkeFnys
	 5ga4aAHMSXa4nkh2GoCFOJHObPYwMzUCu3wfiSj4PY4QTKJ6csLAC0BXOHBw7pmpIXSt/
	 cwAu7Wy6MLe6nEZsAJ+5k8SBcUofXmVf2R6ZGc7bIWBAXclsvTiLpOo96vLHAehcQrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MwxVmmTM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D471606A31C
	for <tools@linux.kernel.org>; Sun,  8 Nov 2026 13:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MwxVmmTM
Received: by smtp.kernel.org (Postfix)
	id DF4641F008A1; Sun,  8 Nov 2026 13:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 485FF1F0089F;
	Sun,  8 Nov 2026 13:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794144403;
	bh=ZTnB61HndBw7vwZbxS/0h0+01nyo+oE9VvOndhhbHKQ=;
	h=Date:From:To:Cc:Subject;
	b=MwxVmmTMMUEOQQXOWZ468FHilc+QtDA/ixrWdI/idSbRDKoDSkv6oCDh9rlULxpym
	 CeVxfAdxDVvwiSvkh3hzZwurJqpvsb3vpjGj4UomTSUoRzMyELadn+SV1ubYp+Zotm
	 F9l09dU8hgih+cnrz/o5gOCaq6Er99pMa5RzNf2X6KpDbBXZODQUZhYkq1iJCTwkZO
	 H5H3yM5/8xodTp/DZiZoeVNSdIOGbezClFhBeVbQzPzPjsBK/dxng0QsoCLMIKB8vN
	 nUHvohokOJMr11GszV6jgNaYYp/kJRhb2m0hlQWnFqaUzFu3Rz3un7LK8HGkU9hRB/
	 naUGw8pCEncpA==
Message-ID: <5d08706e-f5a8-44a4-b172-f5d8642aa785@kernel.org>
Date: Sun, 8 Nov 2026 14:26:41 +0100
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
To: tools@kernel.org
Cc: sven@kernel.org
Subject: b4 review unable to track or fetch a (maybe broken?) series
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

First thanks a lot for b4, it's made sending and applying patches so 
much more convenient and I probably would've stopped contributing to the 
kernel long ago without it.
I've recently started to use b4 review also like it very much so far.

I just tried to track another series and ran into a weird issue:
I originally tried to just use a random message id in the thread and got 
this:

$ b4 review track 20261104194532.8259-1-atharvatiwarilinuxdev@gmail.com
Retrieving series: 20261104194532.8259-1-atharvatiwarilinuxdev@gmail.com
Looking up 20261104194532.8259-1-atharvatiwarilinuxdev@gmail.com
Breaking thread to remove parents of 20261101010737.203951cd@jic23-hlaptop
No series found in retrieved messages

I guess some heuristic to detect the start of the series gets confused, 
but I haven't investigated in detail.

If I try the actual start of thread tracking seems to work a bit better:

$ b4 review track 20261029085504.3547-1-atharvatiwarilinuxdev@gmail.com
Retrieving series: 20261029085504.3547-1-atharvatiwarilinuxdev@gmail.com
Looking up 20261029085504.3547-1-atharvatiwarilinuxdev@gmail.com
Checking for newer revisions
Grabbing search results from lore.kernel.org
No change-id found, generated: 
20261104-add-macsmc-support-for-intel-macs-replacing-applesmc-fa67ce9bee28
Tracked series: Add macsmc support for Intel Macs, replacing applesmc v1 
(14 patches)
   From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
   Change-ID: 
20261104-add-macsmc-support-for-intel-macs-replacing-applesmc-fa67ce9bee28
   Message-ID: 20261104194532.8259-1-atharvatiwarilinuxdev@gmail.com

But then in the TUI I get "No series found in retrieved messages".
If I look at the thread view in there I just see two message because 
presumably some heuristic drops the rest of them.

I guess there's something confusing/wrong going on with some message in 
that thread but haven't had time to look into that in detail either.


Thanks!


Sven



