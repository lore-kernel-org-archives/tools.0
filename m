Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969D71755C
	for <tools@linux.kernel.org>; Thu, 23 May 2024 20:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716496404; cv=none; b=MrPhHz2PVasre9jI7gRE4kLX5HyvnTbpWlCi9Fed0Gq6fuvQFOQbAyaqRK2c6jvAij7u7ELLupSXfMWpGJmkZuvAZU/X0HJ6Uzaj9kQ8s/0w9ViAdwPnEaO4M9ckuRgoOW2gre0YCf6T+WiZsz0bqiUS77TXuO6AtTEiJkJ1kPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716496404; c=relaxed/simple;
	bh=8y1MXoq0WcoNrcEf1LmrL+rJBESvxwWroTEd+pPLbsk=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nJRCNjnVFmuyWLQwhQyUWhUgO42kwYFlXAYrxOm4unHWUH0nIzhDFkE7CCeadgWRiwHpF8wt/CpRLp1AQzw6SILjBigKNy3eSVMJSLfnKgCrn8r+TdxvWyNquAFwLQe++EK5eWLbtWqqFnwtGmVx95n1MrYUMzKc6+Df9OWDgdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VtjRICNw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VtjRICNw"
Received: by smtp.kernel.org (Postfix)
	id 571D4C32782; Thu, 23 May 2024 20:33:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1304DC2BD10;
	Thu, 23 May 2024 20:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1716496404;
	bh=8y1MXoq0WcoNrcEf1LmrL+rJBESvxwWroTEd+pPLbsk=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=VtjRICNwIO3DzdErhUq92JUhNVPc3Pk7hEunLrfJIy+bzCc+GmBbObsBxZvyMtWgA
	 plq7uJ0nqgwWFNI+YHKzvWXpYA0Uh0OEcWZzBGU+J2XidE25rrXgaiZWfyNjr5xgWA
	 N0WliXDa3aqtgZppwnZu03shWMYIAVPHT6JXaY44=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, Lucas De Marchi <lucas.demarchi@intel.com>
In-Reply-To: <20240502191205.3964106-1-lucas.demarchi@intel.com>
References: <20240502191205.3964106-1-lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/2] Make upper non-optional in parse_int_range()
Message-Id: <171649640395.43278.14800565505628740506.b4-ty@linuxfoundation.org>
Date: Thu, 23 May 2024 16:33:23 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-2c6f2


On Thu, 02 May 2024 12:12:04 -0700, Lucas De Marchi wrote:
> All calls to parse_int_range() already pass the maximum value. This will
> be required if ranges are accepted to be negative, so prepare for that.
> 
> 

Applied, thanks!

[1/2] Make upper non-optional in parse_int_range()
      commit: e678e4db27e424bcd69c76e14f633df7f6026ddc
[2/2] Allow negative number in parse_int_range()
      commit: 18e6921e8befd8c2cde9ae989a7197fe5bcd1558

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

