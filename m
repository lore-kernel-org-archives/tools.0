Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5209BA29
	for <tools@linux.kernel.org>; Fri, 26 Jan 2024 16:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706286753; cv=none; b=ZUnlfK81GSPnI07fnmb9uPTYhYdtkOJp6EToJtElrrwk8ge8svBnbTX+GsvmiSUR1uSyq6u82IELsht9xQJrwvKEvZ0xlPZuKVA0Nmccz9Xe9dfBlmI8yhMlvxNpaZJbqmZLh9L3sV08VPLKRc7PWgVoatZh/XBMjYctI7aqOBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706286753; c=relaxed/simple;
	bh=IDCFpx9npyDZruZeIiLAvpJTF+Yn0e54lqUrRXs/I3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZs8/gT/DXw1I0LkVrc6Qs3tGDajUDf+MEHShEsdOM1KsJ+f4jj2kuU3ZL5vrv+mVuIZJcM0DOtdmY51+caA9gj0q1/uvrnl8aDb/hW/MXZnZk+0jZejuYsMDGEorfIfY11pgo3LqLINbkzgU0wwjlEIF7XgeFUWJ3lxISbNp8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=faBMqp4W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="faBMqp4W"
Received: by smtp.kernel.org (Postfix)
	id 81845C433F1; Fri, 26 Jan 2024 16:32:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47F78C433C7;
	Fri, 26 Jan 2024 16:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706286752;
	bh=IDCFpx9npyDZruZeIiLAvpJTF+Yn0e54lqUrRXs/I3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=faBMqp4W3JWtqYKkW6dWbGWdgEbSXw+T4Q5MNo+OuSqgGViHEngXZ7ioOVyGLcp34
	 O/ql7EIVwo6L9gWnq/H619L7WpkU8gd3UeKYGlaARX5YsKeuGYcj2AQ+bR5OVeLWzN
	 uu1xm1YaSXVmg/cFoiVoF7WLSjGrk+RTDH1uQlRI=
Date: Fri, 26 Jan 2024 11:32:27 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Nikolay Borisov <nik.borisov@suse.com>
Cc: tools@kernel.org
Subject: Re: b4 diff failure scenario
Message-ID: <20240126-orca-of-majestic-greatness-f5fdaf@lemur>
References: <b93b0a56-0207-4538-9413-36d59c20ca2e@suse.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b93b0a56-0207-4538-9413-36d59c20ca2e@suse.com>

On Fri, Jan 26, 2024 at 10:51:52AM +0200, Nikolay Borisov wrote:
> The currently checkedout branch is at commit 83e1bdc94f32dcf52dfcd2025acc7a2b9376b1e8 and both .mbx
> can be applied cleanly on top. Of course, manually applying them and running git range-diff
> is a viable workaround but it would have been best if this "had just worked".

Yes, we should try a bit harder before failing.

bugbot assign to me

-K
