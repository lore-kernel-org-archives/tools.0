Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9639528FFEE
	for <tools@linux.kernel.org>; Thu, 26 Jun 2025 17:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750958513; cv=none; b=mep3YARG77vFrZmRInyMm9qaYTpU6qEKCBeSXYqmqzoVddhnmX2CXtUk8OM+CfUQ4XmZuVAKXyiFTD8swK72ti63Meps2XqpQKBjiCff1fih/MQWS3imfdfU3VLkwqVcdzh5agdSx73IDm905Gp9Bs6HzPvke806HGfajdiYM88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750958513; c=relaxed/simple;
	bh=A+3j6yVkC3cE2MP21ceWSTfa72ACJi9WVZ/YvQ6+Eoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gUGymEDUZrCown8l4uYIh9KrA/ivUcj8pSFbtOrAE6pW4NzmQV9BeHncPHFV5AtZG3Q3sCIXgwW9jvuYT7au4h+VGsK5WotTVGCwKGxnwt7kdK7/OYgN+QIAVhnxAoCUilUwA+bCXyHYG1NBmbXNqGaDhjSH6dXI06rTjX0vJqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QjibRwxP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QjibRwxP"
Received: by smtp.kernel.org (Postfix)
	id 2D3BFC4CEED; Thu, 26 Jun 2025 17:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE9A3C4CEEB;
	Thu, 26 Jun 2025 17:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750958513;
	bh=A+3j6yVkC3cE2MP21ceWSTfa72ACJi9WVZ/YvQ6+Eoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QjibRwxP7exTUBH6WanWIVwxHUpNPfzGNfvUZm8R0xSHn4kiqwUDwiXZ9HVi/dgSY
	 QopK8A5fTmXY49EkSnlgLFoe1fbE2AqBeY0Y0rTKBgkkQgkt4IZd8dcYg/F7aOCcmK
	 POhfowhXdLWaBG2KgJh+qaz2a5ER6852VeQCrUYI=
Date: Thu, 26 Jun 2025 13:21:51 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Dave Marquardt <davemarq@linux.ibm.com>
Cc: tools@kernel.org
Subject: Re: b4 send --resend broken by
 8cae1088cf605a12ed3207e7743fadcfa95c252a
Message-ID: <20250626-rough-jerboa-from-eldorado-0339d5@lemur>
References: <87sejmk0j7.fsf@linux.ibm.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87sejmk0j7.fsf@linux.ibm.com>

On Thu, Jun 26, 2025 at 10:03:40AM -0500, Dave Marquardt wrote:
> tag_msg isn't set in the resend path, so resend now fails.

Thank you for the report.

bugspray tag me
