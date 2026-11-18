Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993327;
	b=YvMd56JaEHcS5naObdL9IC0NssRC1bgjHg5aKZY68xUyy5+QNf9RXkLndUx9FLLx/oWn
	 SCu5sk1Es+hLs3KEG6KF8P130tZ6QTlSskcR5sXdzPjYBL4m5HdxVWfVP6zyizNialt7s
	 HuaobwDpaw5ooh6ztlSWdIJqdjeslWIhkNmkkGeKLPSs5VoLypfBlbvhVvMmBuBtZJAEk
	 pDsk1B8Ukx55gXYwee1zCdscAr5v1I+18EODIbzRDbt74W/WVDgkW5ceVTn3lrBea/W9h
	 TDDqwb4xM5Q4ZZzF2WbE0IwEi2zqL2e/xy3jHSMufeoAs2OtOP/AEcLzq6dxH4B+tpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993327;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:From:
	 Content-Language:To:Subject:Autocrypt:Content-Type:
	 Content-Transfer-Encoding;
	bh=119TZ7UXMESWSMzDFb1fEIZxetd/YAlSJgNXn+t/SUY=;
	b=myPUkpF3giMpdrdBpj5TA5OT4hTMFRerJnwJ/8JBRHhm3wHigZqhorCLLzckpLbAPCC/
	 nP+Z8OrrIdNEGKFMCBnxheePlZGUTn5hMjiXJJUe/AoGDUjCORO7rwNBY2XRLhGWw0ota
	 3zT04V83qf9NNTeB9JgfAyuNQ9AJaLutjCG5aPPx9YlkzWz1LfBPWMf7JsZ67MpeMz0GL
	 3O7ceDQtwX8sMApZOkrqujt3KuCe7HPr6Or/NQirhFfIbEhF8QwM1q2Z7RKCvF+nR9RYm
	 wVBrKzi6MzrIinUNqAktNbRRAQGWJ5Qi5BzAyfBNz+lArdly7VI192c/kqK7qy1y5Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bW1/f44D";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16812606A320
	for <tools@linux.kernel.org>; Wed, 18 Nov 2026 09:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bW1/f44D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63DCE1F000C4
	for <tools@linux.kernel.org>; Wed, 18 Nov 2026 09:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794993326;
	bh=119TZ7UXMESWSMzDFb1fEIZxetd/YAlSJgNXn+t/SUY=;
	h=Date:From:To:Subject;
	b=bW1/f44Ddhdoy8/ASBer74M6igqGEyyNqgFHV6NB/9A15dZDVyCvjddRDeBPGSAOC
	 8gvXuez0S8e+1R8QIapWWv7mjraYWpPWaC13txSoSXOSe0NLaf5Lv6qtuSE2o8XZ2h
	 JBveatclQfT6o9l6yh+7BWBH/7D8vKRFNAtYIZ2dpI1Codf7p9vxqKqilT6JXu0cvk
	 8aPHsS9Rc3eamnn5ag514WVrcQCTskvZjO5pdCp2XTt02b72sn2nVELOJRWZRjTvKm
	 i8hXbAvtf7xPKa0noSLTfJnILKoSYZDK9ZpnItCyITeD+dAP5Ga8v5TC5fYDat+cRF
	 7V/bH56dOKAPQ==
Message-ID: <f345711b-8c2e-4d93-929c-c35b57a1b036@kernel.org>
Date: Wed, 18 Nov 2026 10:15:24 +0100
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
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Content-Language: en-US
To: tools@linux.kernel.org
Subject: request: b4 trailers -u --interactive to bail out on editor failure
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

from e.g. git rebase --interactice, I'm used to the behavior that when I
change my mind and abort vim with :cq to return an exit error, the operation
is cancelled. b4 trailers -u --interactive will however proceed. Could it
adopt this behavior too?

Thanks
Vlastimil
