Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794512795;
	b=zxq4ISYPiwcQc1J3pu3BYATiNRNTHVI18hXj+47zTNZEHcPzM+36/eH/++Kbqijsm/ze
	 26zG2ibL6kmHO4l9PaM2owCE/tE49NKVdUo7pIw5KeuzWLgbLi8D47xQG/hggsJpX7kyG
	 ES7n8+GnqxhcmCa9iqsEMStOu69KkiV06cCR4MKdWqqQktbxhAZqmcsuxeDBiZJRG4D6P
	 LzYwHrZEfvSE1KisVQlwEriWRm5wyLcUSgiAbzhnlC65W0sl9QlIWUIZ87B6DElvGJQKR
	 Yv8W0Lpanz5SVyLSjbx8uuhb/PazXq6AwO4TCE3QDbhCnm3CORsuBQTE8us4WFr5aYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794512795;
	h=Received:Delivered-To:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=sjeVGCLeBInXhTruXlPpqKfoIGUd9SXjbaz7T5qZZak=;
	b=cjwIzwFAFd9nEkzic5p3x6hq3joavRb3dIfVBZgoi30s+KEeKD5OaSIPMD6PzKFbyypo
	 5SdbcJAzDM3NjRfENxtwrgRIhfYpGQM5+e53zPcFm6KQouD6e4NBaXmXtFUuHPaaL3ZFt
	 zduPxO/+QwXkxNi4S/n67rBcyPvByTgBOFay0yKD3DVbPp9sXLI28Ug79XzDflgmbCUKu
	 LACB197pHegIfZtZwUGLMxOAnuZELgPtUCUfObHzp2iQabycaOY3WOalXDL3YMdyXcJ92
	 yQnu5hiP2FUAd8HwQpAOozKMu7jF0qxByb7jr2wqG6aDdHyIN7jcUL54epuFoxnBx0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="vwJS1M/0";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA01606A31C
	for <tools@linux.kernel.org>; Thu, 12 Nov 2026 19:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=vwJS1M/0
Received: by smtp.kernel.org (Postfix)
	id C41331F000C5; Thu, 12 Nov 2026 19:46:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E45C1F000C4;
	Thu, 12 Nov 2026 19:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794512794;
	bh=sjeVGCLeBInXhTruXlPpqKfoIGUd9SXjbaz7T5qZZak=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=vwJS1M/0Z367JhmzkFzyWVsiGBUvyEvHhwcu5MiZEP6QleJXKK+tXLI+Nmv43F3BV
	 89RRpxRJTsQhcmnIhgg+eHoJ7jq7WIyI+23QE8cuYC6N2Ea6KbJbHaZqLHtabRzmeB
	 LSInHStxtIvS+/3BN2Hlkv/cKvUTtQC6MRt+a6O8=
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
Subject: Re: [PATCH kgl] Preserve original dates when importing messages
 over IMAP
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20261025-submit-imap-preserve-date-v1-v1-1-91ac2f5b502e@gmail.com>
References: <20261025-submit-imap-preserve-date-v1-v1-1-91ac2f5b502e@gmail.com>
Date: Thu, 12 Nov 2026 19:46:31 +0000
Message-Id: <179451279186.1693101.3646569244001837281.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1595;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=9bxqkKM7iyUnLObg+r7I9CeedHX8yDLblw3OqGqEAxg=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLK+ic8QeavL9ILFfffBUwbVs29fS/oi2DVpqvlrX+VtN
 s+Kfn6o6ChlYRDjYpAVU2Qp2xe7KajwoYdceo8pzBxWJpAhDFycAjCRl/IMf4UeXnI6ZrKy/DNP
 pHPau4AFrBK1kkEP7kTuUpky7VdT8WuG/yUMpd7fc59KJG1f+oPtlolQT8+TTEGpqUX92xW1uc6
 sYwAA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> IMAP APPEND currently omits its optional timestamp, so the server assigns
> the import time even when the message has a valid Date header. Archived
> messages consequently appear as newly received in clients that sort by
> INTERNALDATE, including the Gmail web interface.

In general, I would consider this a feature, even if this was not really
intended. I would specifically lean on this in a scenario where we
perform a "yank" command -- someone would routinely be yanking an old
thread and they wouldn't really want to go hunting for it in the middle
of last month's mail.

> Supply the timestamp from Date, falling back to the first parseable
> Received timestamp in header order and then Delivery-date. Interpret dates
> without a known timezone as UTC, consistently with the digest parser.
> Retain the server-time fallback when none of these headers is usable.
> Leave mbox separator dates out because public-inbox exports may use a
> synthetic epoch timestamp.

I would flip the logic here as well. If we do want to enable setting the
date based on the headers, I would go by the latest Received first, and
only then fall back to the Date: header -- spammers set this to years
ahead precisely so that their mail would stay on top of your mailbox.

So, my verdict is that I'd make this an option settable per-target with
the current functionality as the default. It could be something like
`set-message-date = yes` and it needs to be implemented in all targets
that support it, not just in IMAP.

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
