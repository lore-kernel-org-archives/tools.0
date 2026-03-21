Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105EE2E62C6
	for <tools@linux.kernel.org>; Sat, 21 Mar 2026 01:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774058122; cv=none; b=k0lA1iYr/AFhSljkqhjw3Yqgjr5pILwaR9H7HDyjWYJdAN2/qHmbxSxZKLbpSNL9e1GlvaD6+q6BlxEXaPRurova4U9nTWmNO2jCEZ8GQ2ZUIZUy+QfqoaOxEvPDDq5wZPixwjg1DUxT6WpQmbmdPgkRHiIA7hl979AFDnmDzEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774058122; c=relaxed/simple;
	bh=0GWTf3gR0VJ3ngZKdrgAw7ce+j6YZfOU+Vt4IzbkQG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OS+fejXQlU1acQrFQuwruqvCxC4fSPGdMhb+xenPmzVkrICyov2SdjPtpysul1xj+45Pw289gochKzF5jFdL4Bx8/bvfWKFMbbzjN5mqpdgR97Z6e/UHVeswL7IM7JvkrJ18+hGVC0sO8v1SkEqZxijSISshGCWnaoyLFCVppyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wo1lvhAZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wo1lvhAZ"
Received: by smtp.kernel.org (Postfix)
	id BC5BFC2BCAF; Sat, 21 Mar 2026 01:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E1E6C4CEF7;
	Sat, 21 Mar 2026 01:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774058121;
	bh=0GWTf3gR0VJ3ngZKdrgAw7ce+j6YZfOU+Vt4IzbkQG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wo1lvhAZzKxFq0Bk0DSrqQeT52ZBSH2vYmhDWwt960B01ngNHunQAcFzvZ04K56qf
	 f7/vvFoqPXO2SYH+bxjzV85SdYuJyzbHoXx9QP/NW8iJqntQwG1UK1DNMrTeHOR3Om
	 l8xhx4DJ/Lds/MxTSv934UOGSveh9s4G6g9TK43g=
Date: Fri, 20 Mar 2026 21:55:20 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: "users@kernel.org" <users@kernel.org>, 
	"tools@kernel.org" <tools@kernel.org>
Subject: Re: b4 v0.15.0 released
Message-ID: <20260320-astonishing-authentic-magpie-113d7f@lemur>
References: <20260320-portable-jaybird-of-focus-41fd66@lemur>
 <SJ1PR11MB6083FFF6D6C12C7D487A52AEFC4CA@SJ1PR11MB6083.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6083FFF6D6C12C7D487A52AEFC4CA@SJ1PR11MB6083.namprd11.prod.outlook.com>

On Fri, Mar 20, 2026 at 09:11:00PM +0000, Luck, Tony wrote:
> >     b4 dig <commitish>
> >     b4 dig --all-series HEAD~20..HEAD
> >     b4 dig --who --save-mbox <commitish>
> 
> Not working for me. Tried on a random commit (that has a Link: tag, so should
> be an easy case):
> 
> $ b4 --version
> 0.15.0
> $ b4 dig 9395b1bb1f14
> usage: b4 [-h] [--version] [-d] [-q] [-n] [--offline-mode] [--no-stdin] [-c NAME=VALUE]
>           {mbox,am,shazam,review,pr,ty,diff,kr,prep,trailers,send,dig} ...
> b4: error: unrecognized arguments: 9395b1bb1f14

Sorry, the release notes swallowed the "-c":

    b4 dig -c 9395b1bb1f14

Regards,
-- 
KR
