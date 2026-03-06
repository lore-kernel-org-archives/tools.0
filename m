Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337062BE031
	for <tools@linux.kernel.org>; Fri,  6 Mar 2026 00:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772756619; cv=none; b=JciqEfcH6dKRMaEN+UaiJ2VGyDqv5XEMsSDRflVmghkaMAjkP4nnjqqV2jDxZ+6WMuaZfMzFBF2X/MS158p2nu7/fByaFKz/oBWjWtPzLqZIQMzGbdRxb924YonAMjS1/ehW40Zdq2ty3VbLIsm6hPYCz2Uk97Iao0ivPUbwFKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772756619; c=relaxed/simple;
	bh=uRI2vOjMuc6yJuIc7zsQ4Ps7hz/YrPt4kmtoeN3buj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k6HGH4vx59aidne0sXPHHF4q6xCZOnk4GMddRWAYOLROnKNhyeUO0nXEQ6YeAXdO7DudLMydUbzOfNtyVPMrGG5lN+mkaA8mgvXcJqS+9shfBaAZDHP/qZ590yg+WDT+7c0ct9xiMcOOtCR+/N5ESYusxuq0tppZky0YEkqcmcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tz26yXgK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tz26yXgK"
Received: by smtp.kernel.org (Postfix)
	id 15349C116C6; Fri,  6 Mar 2026 00:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B5EC2BCB0;
	Fri,  6 Mar 2026 00:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772756619;
	bh=uRI2vOjMuc6yJuIc7zsQ4Ps7hz/YrPt4kmtoeN3buj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tz26yXgKuuxF8gRErk6DpzhGTeJV2ANo5OkMX3Lgh23V29QnG8JRKFGdpgS9FTiwa
	 5ppX5cNMXz3oICPc8uOGssWYQx0oe9eWTqtTqBuhDJn8ZmnjynIBCSzHtCt1WDLY8S
	 6Tane9sR5Rny8aIEi1tBpnmSWLPkLHtWTgMfe4uSkd0HYxKhltAfmGN7Ya9s1SC9QB
	 pRUYQT+INDfAhB95QZN0Fo2huTr9aYPIPwtmK0IpA+xEWfIkRgT0a+iirVxuILCe2y
	 eMvNp1yMh9Mzay93jEu4wgQkqdBe+K6gb2e6Ic2TmOi92Z+WBASrnkSJK6tOvrVias
	 2c1zTHYCh05TA==
Date: Thu, 5 Mar 2026 19:23:37 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: odd b4 "Mail:" trailer added for USB patch
Message-ID: <20260305-amphibian-purple-lorikeet-d07cc9@lemur>
References: <20191024205803.qdn6p32iyj5rqvc6@chatter.i7.local>
 <2026020637-cleft-viscosity-c984@gregkh>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2026020637-cleft-viscosity-c984@gregkh>

On Fri, Feb 06, 2026 at 11:21:43AM +0100, Greg KH wrote:
>   ✓ [PATCH v4] usb: typec: hd3ss3220: Check if regulator needs to be switched
>  be switched") (✓ DKIM/phytec.de)typec: hd3ss3220: Check if regulator needs to
>     + Mail: j.remmet@pyhtec.de (✓ DKIM/phytec.de)

bugspray tag b4/trailers

-- 
KR
