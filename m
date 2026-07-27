Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099FB375F9E
	for <tools@linux.kernel.org>; Mon, 27 Jul 2026 20:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785185035; cv=none; b=S39mA5jDriJSorfDepbW//5qv7zL+pH4cJQLp6zPnsmmRVLzYEAHG5guvspijYt8tGS+RCGifV/nO5kbUM3XN8VK3A7dRe5naLKc8hRl4xZZUMfEhrOVDacSGpO5hlNdRy7Ch9/fXrh5njh0yNOeH9bUoGYY/GOfnmIJsEvBxIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785185035; c=relaxed/simple;
	bh=s4mEK9VVBBIS37w+c6zuOea9xkbCDzF33PsrLg1GHm8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=EmoK5cUvqcBnRaOrK3J5w4s9J+8D/syve57qrFUlW/ux+nuz2opSNGvX1jDFIiZUu8Nrg4YzXa7RYAReFW3U0wKehlO9z/Zej+vgaeHlA77s2FIKrSw1Z/Mh3rGrE8nZMFNxAG5eA6x7G96cWzAe4P7q2FjpFzdNWPEkDRYYCmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UeJraN+x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UeJraN+x"
Received: by smtp.kernel.org (Postfix)
	id A574D1F00A3A; Mon, 27 Jul 2026 20:43:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F1151F000E9;
	Mon, 27 Jul 2026 20:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785185033;
	bh=aosGkSP1xD2r8BgvIU3KfvFV8Pw1bPs/PqJJ1i5xx3U=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=UeJraN+xOZRLGfof8Yp5IqCFN+8iGLvgAT5U4UmatbZ5cdfqekU2qbbdT9WhXgzBi
	 LtvzS/GKxeywjCfzErUNUPMOg7BnPYTHkmEZb91P3fn72YTIWwFipkZEBdr4SON9u8
	 EGNUMfoYl+jBHcGkc9Gri4Q0Y7QUnS0U/+OMKJFU=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RFC 00/11] review: track and browse every version of a
 tracked series
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Christian Brauner <brauner@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20260718-work-b4-multiver-rows-v1-0-3c539d2a3095@kernel.org>
References: <20260718-work-b4-multiver-rows-v1-0-3c539d2a3095@kernel.org>
Date: Mon, 27 Jul 2026 20:43:51 +0000
Message-Id: <178518503184.2983685.7373099669069578683.b4-reply@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=560;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=s4mEK9VVBBIS37w+c6zuOea9xkbCDzF33PsrLg1GHm8=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLLSD3PM9vjYc/zkpBU5LMd+Nr/mivdQmVFXP8Vlwf9LM
 YH33t917ShlYRDjYpAVU2Qp2xe7KajwoYdceo8pzBxWJpAhDFycAjARozZGho3ON+8U8OqyNCb7
 Hpz+fHlZ0bPIJ15ZjWxzzmTU8b84vIvhr3z/tVMh2/LVTcILOUJ+Cj9I/cw6OfRBRazly4JZGXL
 SPAA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

On 2026-07-18 00:37 +0200, Christian Brauner wrote:
> The review TUI binds all mail visibility to the revision a series is
> tracked at: 'e' opens only the tracked thread, unread badges exist
> only on the series row, and u/U updates poll only the tracked
> revision.  Earlier versions of a series -- and the discussion that
> shaped it -- are invisible even though the revisions catalog knows
> they exist.

I'm sitting on this merely because I'd like to get 0.16 out first and 
this seems like a feature that should land after that release is out.

