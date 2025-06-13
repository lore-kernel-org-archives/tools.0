Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3C9229B1F
	for <tools@linux.kernel.org>; Fri, 13 Jun 2025 18:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749840022; cv=none; b=MHfF2ZkgGRbDo/rJTf3c7ZFDAZGIQDhDTxd1KTFG0lHk0pD2z7GjEd20I2iYcC+rFO8qPWv8Q5ClvOdRCnAUu8MnGLXdQ5nwJ6xxmcZrpd/J4C81N5ihIbJR2S2Lk3lSj8atF6oc/SsNv1qSvwYSWWgiNj5/lMaq7gqcQguwZwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749840022; c=relaxed/simple;
	bh=S7K3FrzTVK0e9G9Y4MERGMuM2KQc/mPcd88We8BqNQk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=s4bUvHbsGPlH0kHpXp4S9NHLfBryWx8HyHWHB0uh2DEgBeUB/8ZvTZ0JHxcb5TxxYAyAdfnuafgxHSeXRm24KXN/vSH4G5Mo+w0KEPiAcR31KtwinP/jCTDxcmxg44N/faVOfyNufKWUxFz7oTftbWw9depKVH5JeMQ8mJwSTcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BO5pOt2R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BO5pOt2R"
Received: by smtp.kernel.org (Postfix)
	id 72073C4CEF0; Fri, 13 Jun 2025 18:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 315B2C4CEE3;
	Fri, 13 Jun 2025 18:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1749840022;
	bh=S7K3FrzTVK0e9G9Y4MERGMuM2KQc/mPcd88We8BqNQk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BO5pOt2RKpbq62HN6nNUgv4oWNy6taGFBJexB4pTFC1DAgSkDRFc8WH337mgJ1aky
	 xNMXluCbyfvpMuNwKW/zzsy8xByH0FiKRWHL7zlVcebv+38ZlcXARsnBY/hzpcOmTV
	 AruUQ3HbOrkhuezafEABAPVV7chktDF8H78rucEs=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Lee Jones <lee@kernel.org>
Cc: tools@kernel.org
In-Reply-To: <20250613133209.892846-1-lee@kernel.org>
References: <20250613133209.892846-1-lee@kernel.org>
Subject: Re: [PATCH v5 1/1] ty: Allow users to specify whether thank-yous
 are sent to themselves
Message-Id: <174984002207.61997.3629981934365744899.b4-ty@linuxfoundation.org>
Date: Fri, 13 Jun 2025 14:40:22 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-80e1a


On Fri, 13 Jun 2025 14:32:09 +0100, Lee Jones wrote:
> The motivation behind this change was that thank-yous weren't showing up
> in maintainer's inboxes.  This is a problem because some of us the
> presence of these mails to indicate that particular sets or individual
> patches have been applied or not.
> 
> Provide command line option '--me-too' to override the default
> behaviour.  If this is not specified, there are no functional changes.
> 
> [...]

Applied, thanks!

[1/1] ty: Allow users to specify whether thank-yous are sent to themselves
      commit: fade5953b9dca02aac518d786b09aa0142d64a0a

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

