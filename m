Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795663318;
	b=L72VC+D/QnmYOZpeUDQFR7lstocAGMgo4yHfo0wSAsmyK4kgk3RVzdKdAoUqpj2yKV4J
	 nZaWpDYqhB78pORAzCJSHHiNK2rhjQtgl9539PA9l4J4DWtpXZpwqcvjHR3MAWNS/wMpD
	 SwFBlpByiwyMVrMcGci3O9Nn3H/L0h3fBKDWzXpF661IHkyy5w2CoXZ4npeV29U/bLDyg
	 Fy4T420rdpt6vErl6bNf9XsH64JMFEA3A3JVpDoMsocCjktiJWiJ9r4sfPwE+nJI+gC31
	 dv+CNoWHaPtptLj/9XHFHgTO2C9z5iozNTJFYWFx7aUN5ew752X5uNWT0TcHRKz1/LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795663318;
	h=Received:Delivered-To:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=9Pvl2ov7ejuGqWL6zfjZ3urK9S1lQT/mc+3NKKITFDE=;
	b=Pb214rOqA/iu6Yigg4x38xuHw3uY5oKZDW9C4ivgyhS6T5I5zt+2htGMXWFnG1Bt2NFs
	 pXnnoqWdzFtQ9jf6C/WHpuab+g2FxNH4tpO3cP7FiV28rG9vLVZqDJNezt9I6H1dQ3R+K
	 PI4uXv/I4uCDSzg6AXe4tSAxlvonR4whAze+hxeC3Rmcpw5ZPOiCaE979In7wIJ1CLtgJ
	 7+PIWeqgqYn7QNJvPZTHK3eVCA0xttpLVbJUqUnwe5oo+BUxDUUeLB8vBZl0prXsizxnR
	 QLbnlJ77U4/3+Hmrf9qV3piL8bN6HN703JaPvaEIJpjl/3GwSzqo981sumSasNwp2yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=0OWiI343;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45927606A323
	for <tools@linux.kernel.org>; Thu, 26 Nov 2026 03:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=0OWiI343
Received: by smtp.kernel.org (Postfix)
	id DB5831F000D0; Thu, 26 Nov 2026 03:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0190B1F000C0;
	Thu, 26 Nov 2026 03:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795663317;
	bh=9Pvl2ov7ejuGqWL6zfjZ3urK9S1lQT/mc+3NKKITFDE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=0OWiI3432T6HvZwdNmVAe9DR2A6JYtwUR2sXo8NAhyAL7zt3UKDQcbLplcKfYKScU
	 r1DyxZyDlrofodFbF/F2CZQ1PXqBtW5EzD6v5uBe8TBDOgMMQNakhmEyDGNBDNAhxT
	 JBTX8airpDDhqcxcLkJ17XWdBMAjeVeuNNpq6+TU=
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH b4] tests: ty: explicitly set master branch
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Brian Masney <masneyb@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261116-tests-master-branch-v1-1-ead9f70c580f@kernel.org>
References: <20261116-tests-master-branch-v1-1-ead9f70c580f@kernel.org>
Date: Thu, 26 Nov 2026 03:21:55 +0000
Message-Id: <179566331504.1145923.3939094714558108849.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=415;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=RKZyiUi4ojfvdMgmzsbbL1iNg0qi+OiGPFuDvGJUfYM=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLLZl16WkZTl41673/f9B2PnP69dlO7nPpDxvMQ3++TVq
 o9GyxkOdZSyMIhxMciKKbKU7YvdFFT40EMuvccUZg4rE8gQBi5OAZjIMUOG//HrH8doxfz563Z1
 d//xXUeTFxjsvH7Fflvqebdm9cszzN4y/I/eqvxg2r2tc8OZxZfWe7V6JSllcj8XbVr4++BlN5u
 WaE4A
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> The tests assume that the name of newly created branches is master.
> However if a user has it set to main in their .gitconfig, then this will
> cause the tests to fail. Let's explicitly set the branch name to what
> the tests expect when the repository is initialized.

Looks like this already landed as part of a different test reorg. Thanks!

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
