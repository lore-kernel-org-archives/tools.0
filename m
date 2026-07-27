Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5671D43BDCB
	for <tools@linux.kernel.org>; Mon, 27 Jul 2026 20:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184906; cv=none; b=mm3fF6mCRKsdQgmbE5gK+DKYlZuE4a9JJeOQBhUVHRefA+rZyHz/kGL6LN5nlIhnSWW5oFHx+K41ioC7JiW7o4k6EbszWTLKTtQ9IxZ6h1iWmpeYmrFWLM5u/kYC+SWngxq1ddjn1Ldw+nhUcs7xd6v/LKzN1eYj3TwRjj/u9HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184906; c=relaxed/simple;
	bh=eP5iBHdEdO8yyUX3G4X/GWKOjFux/qQJ1HmQY9ijlB8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=icKhxUyi9POYmiftMQdBJBdmZofEk/pk+euZ3+flT57OUQdJ8URAXSZzWJH89Fw3PIMIVctaEBT5u93DZuyJDg+zSXczajyShG58uJ8EihB5ai1g3YXhWHPQhkQWCrqGbtUXnQpu3sxdY12WD7pk0h5QTRKT2iUdcTCgksiKH/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Rt+DHnPt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Rt+DHnPt"
Received: by smtp.kernel.org (Postfix)
	id 1A7E81F00A3A; Mon, 27 Jul 2026 20:41:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B91191F000E9;
	Mon, 27 Jul 2026 20:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785184905;
	bh=cCaXtBk4CGONLUv7wa/h8d6+3htMo6t42CA5LuNjpHQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Rt+DHnPtLubm3CdncqtU6OkXmkmv8YaHSCQB8XiO8ygOsBVAw/GjLHHXLmY9sBuss
	 hJUvOprljd8I3ClGPjGW4wjC71KbVJMi+JQscHK+L+GLy0i89X5kE0UDoKmZCaqHnX
	 FZ2e/B31jMN7LdUf3t362YKz3y78+PI3yxHmC1HE=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: b4 review merge mode with no cover letter
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, tools@kernel.org
In-Reply-To: <ba9789cf-a526-4bf9-8db7-351ff9f2cc11@sirena.org.uk>
References: <ba9789cf-a526-4bf9-8db7-351ff9f2cc11@sirena.org.uk>
Date: Mon, 27 Jul 2026 20:41:40 +0000
Message-Id: <178518490057.2983466.17803402827187089485.b4-reply@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=687;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=eP5iBHdEdO8yyUX3G4X/GWKOjFux/qQJ1HmQY9ijlB8=;
 b=kA0DAAoWtsQc41ZkmWwByyZiAGpnwoiiJ2J/sYoVmgoSEWRdrncAbBCOzFTtxdiEiQLqZnMg1
 Yh1BAAWCgAdFiEEdr5dslJx4UgeZ4w1tsQc41ZkmWwFAmpnwogACgkQtsQc41ZkmWzFJwD+IZdg
 tVxgOd9K2Kh8vHtlaT2GOZHf8cDKf90fxX+n1goA/judHGufsgFrN2b3BsCO9Gw7bdWikXqx6Wt
 xJca3HWIA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

On Tue, 30 Jun 2026 12:40:45 +0100, Mark Brown wrote:
> Hi,
> 
> When applying a single patch b4 defaults to applying linearly, and when
> applying a series it defaults to merge.  With a merge we create a merge
> commit with the cover letter in it but when the submitter didn't send a
> cover letter this looks a bit weird.  It feels like it would be better
> to default to linear when there is no cover letter, you can adjust this
> by hand but it's not obvious from the series list that the cover letter
> is missing.

There's an attempted fix for this in the latest master.

Thanks for the report!

Regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

