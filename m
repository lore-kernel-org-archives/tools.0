Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F143537DF
	for <tools@linux.kernel.org>; Thu,  2 Apr 2026 20:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775162649; cv=none; b=catuKxoN7r5xj1asKTt+jM0gHMOizVdROAjRwnEibMlouS+FO1Adcqhc+zQ6LIE8+2xay4sqTishRC21yyKJlj+0x6rLf9jS5ekNN17AqntoLnDQTdVRWXB21eT/Q0u6sqlABmP/fxCQ+o1EGK20p/kkrsGUEr6qBstItgkN30s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775162649; c=relaxed/simple;
	bh=IB1mjqV+HcC/iiPhJyqIVJtq/LpfQ8nEXOXR8BNJFpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sNhEdP0zX8NIqfPWbfzJ9tgJS6RkgkZ+f+/H7gPpKQDppl41UMUib427uzIpWK8svVFujOvYB7M760yvLZM9E6Cg3BWecNRgpLuFS6fSvTt2SdkSE6Yj0BR7K0T6mJK/vwfvwlP6JjG+GoDjR+xkai6FM953N5NsrlPDI+QqxBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LkLz/0ek; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LkLz/0ek"
Received: by smtp.kernel.org (Postfix)
	id F0B91C2BCB1; Thu,  2 Apr 2026 20:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB264C19424;
	Thu,  2 Apr 2026 20:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775162648;
	bh=IB1mjqV+HcC/iiPhJyqIVJtq/LpfQ8nEXOXR8BNJFpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LkLz/0ekVeQ2TmrrbOPFwBq8lYeGvkjWU/RKCspwKp4A2rxM3JD5CyZOoKWeDmRPP
	 Ww4IZKe0aAP+kKeZrUrs3feMf9bJ1zw1VX//kqyFtgKj4olfmkecj9F69XFN73sR/y
	 pg4S2oDpp4RtigcJuUay1K7u39QuDBu1xrWlAfVY=
Date: Thu, 2 Apr 2026 16:44:07 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Tamir Duberstein <tamird@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: b4 type checking
Message-ID: <20260402-wakeful-enthusiastic-labradoodle-5ce67d@lemur>
References: <CAJ-ks9nyNcqk0LPdCsir1i8=2FQZEEVRx6fTW6FWsCpiNDbJvA@mail.gmail.com>
 <20260402-didactic-excellent-scorpion-8f5189@lemur>
 <20260402-messy-acoustic-wren-63e0b4@lemur>
 <CAJ-ks9mZc=Q-KVnF0K=0HVW+rLxVa4beOqRFWs-N5qKKCW=9Lw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJ-ks9mZc=Q-KVnF0K=0HVW+rLxVa4beOqRFWs-N5qKKCW=9Lw@mail.gmail.com>

On Thu, Apr 02, 2026 at 04:07:15PM -0400, Tamir Duberstein wrote:
> Thanks. I think part of the problem is that you're using `uv tool run`
> rather than `uv run`; this uses your global mypy instead of the
> versioned one in pyproject.toml.

Ok, I removed the stray ignores that were needed for older library versions.
We now have:

$ uv run --extra tui --extra completion mypy src/
Success: no issues found in 46 source files

-- 
KR
