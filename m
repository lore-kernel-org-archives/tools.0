Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D8B626D2
	for <tools@linux.kernel.org>; Tue, 13 Feb 2024 22:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707864378; cv=none; b=BIXc1N2GOLgrDiRGmRLFe7DKxF6wbvBDWvfzN1vDZYCN7uxh8z6kGQewB7LAvLNfTax9tz/cF6hdZFB2a7TpryLGLUc6K1ivnv3ri/rkAhDHqe2pesjpZaA+Dsp2Bvy/g0/z7C5HKo12F51eOhozIMvspGl5qp0TiXq33MxSKaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707864378; c=relaxed/simple;
	bh=A2SYX/47mxNW+gOdwH90yDc4ZIpl7AEoZ4dD7fru02M=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XHLyZYqzDwBl+13l0vVgYXnksq6oq4cDHsuy/TFa4wt1uoRLUPxTatWHmJH6fc+cYxW/PZMgIuIXKgZF9/6GbjjNNaeALRU4JhUMLN2TfBMTLC8/f9GFnCZtqbaNnglLAYCzz0dQveJ+Mdl4PfCQyVXOflnDmmyp7/AMIlQ/qv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XT3m1wSW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XT3m1wSW"
Received: by smtp.kernel.org (Postfix)
	id 44D4BC43394; Tue, 13 Feb 2024 22:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F79C43390;
	Tue, 13 Feb 2024 22:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707864378;
	bh=A2SYX/47mxNW+gOdwH90yDc4ZIpl7AEoZ4dD7fru02M=;
	h=Date:From:To:Subject:From;
	b=XT3m1wSWXi2M0ooPQr9DeBCoYcPGcCr2Y91522aVXVO7py69NoS6QmH9jiQ9amqmX
	 svswc2mHCEO0/Mz/r88OFLZHqJ3AGrIbH++W1uP2NpVBybbGgmTh/zWrAUW/S1NIiK
	 y4dHcO6VzorRakjAvOwZ+Rc0oQjdceseIjY0PZRw=
Date: Tue, 13 Feb 2024 17:46:12 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org
Subject: [b4] current master likely to become 0.13.0 this week
Message-ID: <20240213-adaptable-coua-of-acceptance-e6ba2e@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello:

Just a heads-up that there has been enough churn in the current master to
warrant a 0.13 release this week. There aren't many large new features there,
but enough improvements across the tree to call it a "quality of life"
release. :)

Please test out the current master and let me know if something is broken for
you.

Best regards,
-K
