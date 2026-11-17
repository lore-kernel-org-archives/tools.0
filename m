Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794953562;
	b=cwqnf7MBn0Ml0aiiG5W+8rhaxVPCAIr6s3BnKnkIdxDDPIlT5WE0dB0nQkG3z0xP3uM3
	 7cJdrzpx9ZQBYebDcJocLHq6H+e2GHrEQYY/UpgN5kJZp/GupdOcV0iHDlC2newGvY5Qz
	 qNaKkc7TdDmwnXqWqBSxAPWQa3yErFyAUoeVS6Vm2NIHhq2ABmX4yREAFYStIIDiNxZL7
	 aEIsqePQo6ONj9k1IS3bOu6L/8dccHXBU3Q6RIwspj6rfq+kVfv65QeuhxBcKB8rcZ1Re
	 h3wyb1MMvAmUfcNYXipWqzs97DGexTPNIIBFqA7cf7qwHyKnU521I9OzQ4jBBNCOi+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953562;
	h=Received:Delivered-To:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=DKwcz8c0Ouw7+NwIgYOTSky0QsMQhpNimOZzPK7hNxo=;
	b=b5uZjat0tgV15ldGFVVvVj3Rudst+b1UfCJBEqrMBFGDjl/ug9J2PtCNg1K8YbJMn416
	 QdAPbGQwYfqANrl6/0xGCFvQucv46DsMixtRsXL8+gA5WhFVHXis+6rRFjKI3bcDLXQze
	 B4WYsilUSxB1MnCs+oXqThRFFAZuCGMvQyNj16qMAKUIyLHGu3l4fZE7y4weK6OEnwleY
	 WPd62UeONbuyi0L8ycy60ZxR6WtH1BQjfCjgwhFcFtmX0+rTaaoUuAOkevbUQLds8UQmW
	 TX4b7+r91fqHn105gp1xfHo6qAfpPu8voT2ZjhzAOqY5WTKowL5Y19jWeJeb61SYmew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=dZegly9u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E36606A32A
	for <tools@linux.kernel.org>; Tue, 17 Nov 2026 22:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=dZegly9u
Received: by smtp.kernel.org (Postfix)
	id 416931F000C5; Tue, 17 Nov 2026 22:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA8F1F000C4;
	Tue, 17 Nov 2026 22:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794953562;
	bh=DKwcz8c0Ouw7+NwIgYOTSky0QsMQhpNimOZzPK7hNxo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=dZegly9u7jKSlYXyL6Ox34ewyhk5PtcA/O1PUj7PH6g+VxT8konCNZwSzH1Vy0SeG
	 BcvHtVh1SAq+FvZC0J4Ik1uhhADMJB0HDSzdsYSGsBFfTH6bWAY8l0fGV1ZHLe0j3L
	 eON6QBkSYZoVK+dPRTCBO60TkOsfuduXwI5n6Clo=
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
Subject: Re: [PATCH b4 v2 0/2] review: add support for b4.send-me-too
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Brian Masney <masneyb@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261116-review-send-me-too-v2-0-3e1e305e3272@kernel.org>
References: <20261116-review-send-me-too-v2-0-3e1e305e3272@kernel.org>
Date: Tue, 17 Nov 2026 22:12:34 +0000
Message-Id: <179495355454.997809.5612394401362326937.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=488;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=Ua2zmZotJowzKbPomv9JO80E90tNlwrIkznXOC2zJFI=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLL+XAzJZHyy61Kej8hXh5a4MrvyiI7FbiJ7DaNvHqyel
 BF5SGVvRykLgxgXg6yYIkvZvthNQYUPPeTSe0xh5rAygQxh4OIUgIlEP2L4Z216T3PZpGnNylUf
 kpu2BJw4vSZjyXR+bt4Dq66slp/wfDbDb5YzhysbBThmfV6h38G+/9StOf8smz/7Wh/yd9PfFvs
 hgAUA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> The contributor side of b4 already has support for the configuration
> option b4.send-me-too to make sure to include your email address on any
> outbound emails. Let's go ahead and extend this to also work with the
> review and ty sides of b4.

I didn't end up taking this directly because I wanted to disambiguate
"ty" from "send", but the latest master should have the functionality
you're looking for.

Thanks,

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
