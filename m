Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3BE255E20
	for <tools@linux.kernel.org>; Wed,  5 Mar 2025 19:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741204532; cv=none; b=LQLps1mRFbr2ikYAhhHxeHFi12O00K8dnREIV9jHCd9TfnuyqtBo/kVDSFPDioKHG6Ze59OiAT5h9P5IpUAOdNNIy59Z1NzDqkRKWuse16aRt5ifaTHqmGmpdDIv/wPuHnUS7ybErmeb5jrxGTzxUn8dxJJsLnTKvr2F5bl2Ubs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741204532; c=relaxed/simple;
	bh=Tcpnd/n63VG8oS0dM+Vgq2h3OQPOOqvFjFqwawbyerM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ih34/GjubhQLvqcG58aDfaO9xO17xTJ6U5Wxx3PSGK9TA56cbPyw2OUECK+xDLEdzUZ2K5NXSJZ5QwhxPf3T+30GDOGiKn72zzzvFz+8yw2Zc/aCn5U+RQBwbLs2DCtfZ6MecSx18UQ1oy3uLQmVNVUwl0SXHRX2tyRk38F7Bh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DoZdQIn0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DoZdQIn0"
Received: by smtp.kernel.org (Postfix)
	id 55A8FC4CEE7; Wed,  5 Mar 2025 19:55:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D3ADC4CEE8;
	Wed,  5 Mar 2025 19:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741204532;
	bh=Tcpnd/n63VG8oS0dM+Vgq2h3OQPOOqvFjFqwawbyerM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DoZdQIn04mPTSWdtwXOC0+6yPBI2LA0q0DVWWCJXfD+2OES5Zqq83GA8A6kKhguEQ
	 I9jmGsVKDsR1KZhFVL2rnKiIQtZTPupUNzfrJzuhYFewF+gzucl7f+7CafIcuwG/zX
	 oKuXPTxY9kNYdlUdSQ526nNYX2wP5yDhT99mVygM=
Date: Wed, 5 Mar 2025 14:55:31 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Andreas Larsson <andreas@gaisler.com>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: b4 am getting extra patches and missing patches
Message-ID: <20250305-therapeutic-caribou-of-force-eeca36@lemur>
References: <5972f5de-931a-4186-ab0d-cd226f19cde6@gaisler.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5972f5de-931a-4186-ab0d-cd226f19cde6@gaisler.com>

On Tue, Mar 04, 2025 at 04:42:33PM +0100, Andreas Larsson wrote:
> $ b4 am https://lore.kernel.org/all/20250218-jag-mv_ctltables-v1-0-cd3698ab8d29@kernel.org/T/#m6e83d4c31cffc76f16d830bbb79c9e3efd1e4d89 

Looking at that thread, the messages that mess everything up are from the
tip-bot, because they technically contain patches that are unversioned. When
b4 sees them in the thread, it's not sure what to do with them. Unfortunately,
it also breaks in an unexpected way, because it adds them as 1/8 and 2/8 and
also increments the total count to 10 patches (which is why it complains about
9/8 and 10/8 missing).

I'll try to untangle this mess, but it does work better if tip-bot sends those
messages with "Re: " in the subject.

bugspray tag me

-K
