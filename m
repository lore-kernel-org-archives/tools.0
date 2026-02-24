Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8840F34402D
	for <tools@linux.kernel.org>; Tue, 24 Feb 2026 22:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771971147; cv=none; b=vAl9i1q6u3sv+g1boo4c7Tgl5OZCtcEXyUJeC2MwDh5KgrbkWSSooFaOlV/JoW4EX/lFj6MmS68VKEGeOZwIX6ovOsC4vDkK2WemGYRx4cVqGXscAzdlHgcLs5bpficRyTRB+qMc7KZDuA5jGUyCh2YaV6v59h/cgdVOtS1eIDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771971147; c=relaxed/simple;
	bh=3QAabPw6Z4C9Dc5QrcrMpskjIFtdjHCQgnJiax0Woa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uhX6ZRXlsw4ad/OUQ5Uu/Ji9CTy338kIcs4DVNrSGerpKHU3s7WVpHgcvNHbBGwjZ9ALSSHZ9Wj5XhLLJKCupnL4Ghn31Zg3sMxFUg03XCRbTcrrb5iATvyXNVEwSsnZAb//ts6++r7d1X8BMO3Rqm2xqBSVL36mZpNRrRiZnkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kJK4XiTM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kJK4XiTM"
Received: by smtp.kernel.org (Postfix)
	id 36AFEC19423; Tue, 24 Feb 2026 22:12:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3BB3C116D0;
	Tue, 24 Feb 2026 22:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771971147;
	bh=3QAabPw6Z4C9Dc5QrcrMpskjIFtdjHCQgnJiax0Woa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kJK4XiTMoS6qvco+Q1ou0jn9KEvgmx8YUWlXijey03mLtbt5BwqaQzBxkuS8nZFmb
	 S2apvIK3UweyZa6pRrBYMsRMZ+XXxvUy+9vraRiQYj/vGDN+OHTU62vQ96HVClo61v
	 l790MaDRAxolRYu876up7GfTqyqo6l4NeIMQxMkM=
Date: Tue, 24 Feb 2026 17:12:25 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Dave Marquardt <davemarq@linux.ibm.com>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH RESEND v2] Make edit_in_editor use temporary file in Git
 repository
Message-ID: <20260224-new-amorphous-snake-99e5f6@lemur>
References: <20251118-edit-with-tmp-file-in-repo-v2-1-0b633b471ddb@linux.ibm.com>
 <177196128601.4027376.7838697675997419538@lemur>
 <87zf4x246g.fsf@linux.ibm.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87zf4x246g.fsf@linux.ibm.com>

On Tue, Feb 24, 2026 at 03:59:51PM -0600, Dave Marquardt wrote:
> > Consider using `git rev-parse --git-dir` to obtain the actual git
> > directory and then creating a `b4/` subdirectory under it.
> 
> The current code in the b4 tree includes my changes from Nov. 19, commit
> ab9639a7685a0e488f7d32783d55aaa2101acc68, and that code doesn't do what
> is shown here. I think there were more iterations. I'm not sure why
> we're discussing this old thread.

Ha, because I'm dogfooding "b4 review" and I have a memory of whatever is the
opposite of elephant.

Sorry about that! :)


-- 
KR
