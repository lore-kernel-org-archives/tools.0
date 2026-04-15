Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD3E3E4C74
	for <tools@linux.kernel.org>; Wed, 15 Apr 2026 18:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776276839; cv=none; b=opNepPddHOvNG0NBDidB6VZoMw+t4fanjXAoSMR0IvrWsB2ORk8+PXub0hZcSHVOow62b1zuq/5OReAobot1CvdK8ijKQgKzCaxlfvZykNy5f5DT5MAVyq5wwU3LAJbK1ayD05aE9jtYFAttespP4+qABzCm+0Je0WSpNBwlddA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776276839; c=relaxed/simple;
	bh=zsvJDiLaX/fw4SBQoC2xccf1vEuRCBL6AB/j/p7je44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8EyhzmersBid/WfAHrlWiw4cNdpjlNwLJ2Qy0OYQ1OdIzKQMTApxaB218JEjhvMFBdAb/61gGEXcrZe39mWGbwVUglhfzG5NFtFcanubNEOc2n8mVD06ZCa8IH6Br94Vki2CWl/aahFv5Np4cdtsP7oIcR1X+Ncqw8hIswGxuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Pw95abQf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Pw95abQf"
Received: by smtp.kernel.org (Postfix)
	id A2C1FC2BCB5; Wed, 15 Apr 2026 18:13:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE40C19424;
	Wed, 15 Apr 2026 18:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776276839;
	bh=zsvJDiLaX/fw4SBQoC2xccf1vEuRCBL6AB/j/p7je44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pw95abQfH2RcPTtN0m6ELK1YzIdI86GVKAdjjP3NR73QG3o2jG59v5QWecOKINzlF
	 Yski6e/sPD4eCk+HYqIaoDxLti3utkEkp+WS84nx7GH58fV1FwpPtvZvnQfHTooaks
	 ml3x3Qu54tq1ReFAcPpqLqvaTwVAwr7jCpP5/uJc=
Date: Wed, 15 Apr 2026 14:13:58 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH v2 00/14] Harden local type checking and test mocking
Message-ID: <20260415-thoughtful-calculating-crane-2dbd7b@lemur>
References: <20260413-harden-type-checking-v2-0-1ba6056288d9@gmail.com>
 <177618771367.847180.16159053169602920819.b4-ty@b4>
 <CAJ-ks9=sT+7_D+QnN6RLid-1izKLWZqTcPwqVB+dAdRr3Ns5_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJ-ks9=sT+7_D+QnN6RLid-1izKLWZqTcPwqVB+dAdRr3Ns5_A@mail.gmail.com>

On Tue, Apr 14, 2026 at 07:38:41PM -0400, Tamir Duberstein wrote:
> Thanks! Should I revive the b4 series, or wait until you've bumped the
> liblore pointer there?

You don't have to wait on that -- the master should be quiet for the next few
days as I'm focusing more on infra work, so now is a good time to do a big
linter change.

Thanks!
-- 
KR
