Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6372014037C
	for <tools@linux.kernel.org>; Fri, 26 Apr 2024 12:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714132929; cv=none; b=XqwIRLIiWEP01T6fmxude8sjqeBKGWzU5dEd6RdSgLeLFdjCuDaiWOatUWGteD7O8xPuP7pmWTH+PbWmaSfQFMQdBKbEFstkKuytNtEDmCQwxifgNzU85ted6Wm8SKNNeceOXrllvVMoExgxXiYvs6CKlImwt0CGuNNcwkTY6ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714132929; c=relaxed/simple;
	bh=0ux+NZTV7fl34Ft+6yq2DtLNiemyBXnFZG1jw98j3Yk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=WuPHr6buqoHe/IxFOWLZJWwho0LfxUvCYOl7TiFlm+qTjLYOxYtuqdYsx3zTGAB57Gel2YwSd8qFeB1jk4jRxxkMQRs/y3BaEa2AFczrD4Mwmzg2igjIeuS6tMGGhfjZnsIlUXMdoN0GsMVO21xPObpm6LRhVTxi5ArPIAmrcnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pcUXMCVP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pcUXMCVP"
Received: by smtp.kernel.org (Postfix)
	id 05303C116B1; Fri, 26 Apr 2024 12:02:09 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C0EA4C113CD
	for <tools@kernel.org>; Fri, 26 Apr 2024 12:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C0EA4C113CD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D686B240004
	for <tools@kernel.org>; Fri, 26 Apr 2024 12:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714132919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RL5v8JcrpoEgzA5AN9ylr2TWaFRJwDUXPaPrxyO071w=;
	b=pcUXMCVPNuAhL3FSEWIxtyjhiwTsqHdZg1nClaDvDEc86Mhk8zMueAvxti8P4LIBQuKVTj
	qSQEOIA0nf0DNJbOr3472kDU4TGWdmUuUXhgkbTbf4bgS5YFbagoh+1D8qQDqvDGS9JDwC
	4dLlDT1PcaBXvzfK8ov5H8Uusr0+F4C4qkcALVoo0G3krE1HTQles7vZiAFJwELYjVm0hC
	/vKRA2YmvoZPMRtk48ocy6dGjcyNqXd8IVrtplyT7nalVx5Dp4j4tDzCGQx5cwMZegDr4W
	rDFB7sOsNTW+ddg08IkwSSYflgzEiVbbsn6DxuidBVLXwSOSpLx2GAF9owN8Yg==
Date: Fri, 26 Apr 2024 14:01:57 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: tools@kernel.org
Subject: b4: use new trailers in 'b4 send --resend'
Message-ID: <20240426140157.349783d6@booty>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello,

first of all: thanks for b4, I love it when sending my patches!

I found a little issue when resending a patch series with unmodified
content, but with new trailers received after the initial sending.

This are the events involved:

 1. send a patch series (b4 send)
 2. receive some Reviewed-by, but patch not applied and no changes
    needed
 3. update trailers (b4 trailers -u)
 4. resend (b4 send --resend)

At step 4 I would expect b4 to prepare a [PATCH RESEND] series with
the new trailers added. Instead b4 resends the exact same series,
without any new trailers.

According to my experience in contributing to the Linux kernel, having
the trailers added when resending is the primary goal when resending a
series that needs no other changes, so I think it should be done by b4
automatically.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
