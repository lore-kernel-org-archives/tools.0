Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B0419CD03
	for <tools@linux.kernel.org>; Fri,  6 Mar 2026 00:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772756702; cv=none; b=Mxgga6DCiFmoRwetUGB4vrqBbgnMIzX0fhdDpgLXgZQneY46WdCksqp1XGLnZSYfMc5XMsuEQlyZfIBeWKP+W/JTsKM81ZchVIbaEft6YIb2yIcxMCqDgtf+BEyyzJRDZ6ErtbROPSM/QjshHW2mJco/LVsj0M9TaeSH7q2KCd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772756702; c=relaxed/simple;
	bh=U8tiEFGD8hzWRhiZza8CPTa4tbVmgjRwBsFUEKBk/ys=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=HYPCHRGtl589tIg+XW0ewPVrmX2okD5DqSKERdmenlwq4R2AxvMk0NQJ8RQ5q787CPtdYFbarCdgzj+AncYE+IjJGAo7VLB9Bri2lm0duVVnRUe7gbBgQ/vU57YwcQlQ3/viRsUcMtOP8yv0ZkB73w6+0necNHzQD+0G+V5FUrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UJrSviAq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UJrSviAq"
Received: by smtp.kernel.org (Postfix)
	id 3A22EC19423; Fri,  6 Mar 2026 00:25:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23E4EC116C6;
	Fri,  6 Mar 2026 00:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772756702;
	bh=U8tiEFGD8hzWRhiZza8CPTa4tbVmgjRwBsFUEKBk/ys=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=UJrSviAqKGlZrZ2Z3sO8uYgg+vwwVYjWPNuUt1NjJ4Vgw8dT4Tp71Nnds1nEIftfX
	 9kr30WfrZacDKgiuUdsT/rzDADCpBKUtzhGeZGzoNa40F3v01GKPXX5n6SrmaUv48w
	 E2bgPg8PUUdGPI3WndSdYa/0AWnnTH6935gkf4jrIM0YFZS6QzhZ6fC3Fs6QCu4YaC
	 ezlaIIOmJ4cYMJKyXAwESlH7H1bucRqUkv/yz0fYXE3neYSV1JRS7JPxbmKDoKGATk
	 tJ77g7aRQsVeo68zS22bRK08xR96ZseqVNxYfiS/AQxBAY/Xvj4w0ZY2Sj3hI3G5xu
	 ITsvBUcbLeK+A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 05C2F3808200;
	Fri,  6 Mar 2026 00:25:03 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: B4 Bugbot <bugbot+b4@kernel.org>
To: gregkh@linuxfoundation.org, bugbot+b4@kernel.org, tools@kernel.org
Message-ID: <20260306-bcd06df9e282665334001751884c687a23d500a3bd17be35d4d2fd8a6fd137880-5036c0dbfac3@git.kernel.org>
In-Reply-To: <2026020637-cleft-viscosity-c984@gregkh>
References: <2026020637-cleft-viscosity-c984@gregkh>
Subject: Re: odd b4 "Mail:" trailer added for USB patch
X-Git-Bug-Id: cd06df9e282665334001751884c687a23d500a3bd17be35d4d2fd8a6fd137880
X-Mailer: bugspray 0.1-dev
Date: Fri,  6 Mar 2026 00:25:03 +0000 (UTC)

Hello:

This conversation is now tracked by b4 bug tracker.
There is no need to do anything else, just keep talking.

--
Deet-doot-dot, I am a bot.
b4 bug tracker (bugspray 0.1-dev)

