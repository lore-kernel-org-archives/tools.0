Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF30EED6
	for <tools@linux.kernel.org>; Mon, 22 Apr 2024 04:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713760281; cv=none; b=LATnngKWSA+Uzh5zcxgrExq6psA9LCOkktgx/iKc6KqnxdgWMLHy7T2eLbmOG+TZsXQzNZU0KZxhvH9kxJT2aO94ObLBzw3slzbMawRayzcs46TgEOvZIZ5jD3I9bd1AdITc/kecQ9Yv1vQZHOlM6PymqW3QstIEu291H0QHGQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713760281; c=relaxed/simple;
	bh=0XdDtHnhcf7cp7FKRW+41N/Jg+eEyGSerskvr9WFXKU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hx9FaA2tvViqVaSqzYePhtMpALcvJtQJg19txCnUsa+ImxjbW3GA3WpX8WMOvndvpDJSWJ3E1083q3BV08BNJitxEOiMcd41KJIdv52J6y5EF3bADJoWjVC+JCFp9Y5lFZqkVmzMLPQ71dnwJHzBDnKeiIqrorqDnsL56ZNvgFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=hpfr.net header.i=@hpfr.net header.b=W/XGnaFb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpfr.net header.i=@hpfr.net header.b="W/XGnaFb"
Received: by smtp.kernel.org (Postfix)
	id D65F2C116B1; Mon, 22 Apr 2024 04:31:20 +0000 (UTC)
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8EF6CC113CC
	for <tools@kernel.org>; Mon, 22 Apr 2024 04:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8EF6CC113CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hpfr.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=hpfr.net
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpfr.net; s=key1;
	t=1713760276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=0XdDtHnhcf7cp7FKRW+41N/Jg+eEyGSerskvr9WFXKU=;
	b=W/XGnaFbPIKyDTtrgjHgZkO8XPMkErz12qB8jg+l5DUms6qLtYt3/qw7A8lQXuf+AtKuNT
	RnGWJS73CEKZehVUkMyKQUaAmXKAFIH972H3fH5KGi3EzZnVkPXseQlQ9m91lpUPHCRvRT
	cXasLpMRxdJqjZ/LNpqcxxfrIjjZN/GZrjUxUO/5xelkiMbRPjPARQT5xBUiB/eyrQPyqQ
	UOE2Opq8Wwz/CQKPNRrwzDEELyxKSXDDV48KQyrXoVVOP3HqSQFo/1tm0ZOQblwV/U0LVX
	amOQfb5awB/I0tGQylvDTfuDyBLMNdRuxk2/ALsPwZM65rOoZTJCkIOxmAoB1Q==
From: Liam Hupfer <liam@hpfr.net>
To: Kernel.org Tools <tools@kernel.org>
Subject: b4 sendemail.sendmailCmd support
Date: Sun, 21 Apr 2024 23:31:10 -0500
Message-ID: <878r16nhm9.fsf@hpfr.net>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
X-Migadu-Flow: FLOW_OUT

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Konstantin et al.,

git-send-email(1) supports `sendmailCmd' as a shell command-focused alterna=
tive
to `smtpServer{,Option}' [since Git 2.33]. Could b4 as well?
<https://git-send-email.io/#step-2> is a widely referenced tutorial that su=
ggests
the use of the newer option.

I briefly looked into writing a patch for this myself before chickening out=
 at
the number of conditionals already present in get_smtp and cmd_send =F0=9F=
=98=85.

Thanks!

=E2=80=94Liam


[since Git 2.33] <https:/git.kernel.org/pub/scm/git/cgit/git.git/tree/Docum=
entation/RelNotes/2.33.0.txt?h=3Dae3196a5ea84a9e88991d576020cf66512487088#n=
9>

--=-=-=--
