Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C9B2868B
	for <tools@linux.kernel.org>; Fri, 10 Oct 2025 00:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760056293; cv=none; b=fW20EB7Rg4ELIHr9VcxGEbekYdU+0ykO915I/h0pt0T2fh0Z9GDOWzkXl54z6zRzkiLvfPlZGmqaCMyyVBG62NxibytT0uEnuBAS1Sana5c/Vsb9OBmJn2gqwDG9V+aHP+50CMVHNMT4dEm0xtyJwf9S9yiBIr18Ox7byLH9hFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760056293; c=relaxed/simple;
	bh=FHG8dmUHLYM1YZGKrxc0BUNu7zGRkqyv16vmGwQ0/fI=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pHbwr4uc3LEm3sdyd433H2dLFgNsiCgVsvitF5wWQO8WyQ/24jqFvuCCQb8l98In6OyWuXcQaSb1F03yp7cydh9DPtduBTDrMyqwAbJ/ZV9ig1JWf+mOtkZmsaWl2qt+jyUIU33Ynpzgi5bQxZAcyExqsN8yCgxOdXwcFiS7S3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kutRJaAM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kutRJaAM"
Received: by smtp.kernel.org (Postfix)
	id 1ECF0C4CEF7; Fri, 10 Oct 2025 00:31:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1AA5C4CEE7;
	Fri, 10 Oct 2025 00:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760056293;
	bh=FHG8dmUHLYM1YZGKrxc0BUNu7zGRkqyv16vmGwQ0/fI=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=kutRJaAMWSxD7f601DqCklsXKi2Z3mhijUsxV+LTrF1rYYQvVJCbq4ChHf5vc4gwC
	 xGKK77y1owuY4+5pt0b92ywEsxRuKBPot36jOR9O4pk8McG1bhuIlHOGG0wY7r+Ec0
	 zOVYI/XwrJlFP90ne+TvcB953Ond7TijoDBehqrU=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <20251009-jk-email-alias-support-v5-1-f37072c22034@intel.com>
References: <20251009-jk-email-alias-support-v5-1-f37072c22034@intel.com>
Subject: Re: [PATCH v5] b4: support send-email aliases
Message-Id: <176005629275.310889.13669298071329860917.b4-ty@linuxfoundation.org>
Date: Thu, 09 Oct 2025 20:31:32 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-f760a


On Thu, 09 Oct 2025 16:01:54 -0700, Jacob Keller wrote:
> git send-email has supported the --translate-aliases option since v2.47, as
> commit c038a6f1d748 ("send-email: teach git send-email option to translate
> aliases", 2024-08-17)
> 
> The --translate-aliases option allows asking git send-email to convert an
> alias into its real address according to an alias file in varying formats.
> This enables using the same aliasing behavior as git, without needing to
> implement separate parsing logic within b4.
> 
> [...]

Applied, thanks!

[1/1] b4: support send-email aliases
      commit: a4cd516aace3018517b0602a8b6b49cfee73efe3

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

