Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5876F3D47AA
	for <tools@linux.kernel.org>; Thu, 19 Mar 2026 13:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773926354; cv=none; b=E26DlQt9/Q/6WAtmEB3FlkgTQRCjzlPjrQv1Uw0BTaJaNMa7kWzG8V+E/DyaVC95X8OD9wCq/SwQ2v/qJN86NMzO8P0fdQyfSrDW1OlYv/TzUhPHrPrrFv2sJjtb6BIQQECJ5hpUzODEQWycBLw/qX00qFTboYM7eDfBMciHVO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773926354; c=relaxed/simple;
	bh=HSwFzGZ9F6bb7nLotJzF7IdaYo8L9hCiC++wArQI9Gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TXjUy6HCYfTVsgGHLj5nnpt5eu7gBFLpogeG+FzroV35MsyRzMNRemeNvb2buH4OKKdASjKsx5XcQQT1QSuT2xjieyV501OjmKK1k2/Y1vFZBgf4Tf55MEs1uoRUdU8kjMHQKg03KklxkxTuiNvNgUPZ5YgXv+bH2KXAU591ukI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cx8lbs8R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dXrx6KAe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cx8lbs8R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dXrx6KAe"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J74QmZ1772036
	for <tools@linux.kernel.org>; Thu, 19 Mar 2026 13:19:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jcgutIDYP3LXPrjhG3INGWkL
	LRobk4AN5uy9lV6AJrk=; b=cx8lbs8Rfyf4b8hKowF8qvHDfS0k1npzXGz3szQa
	OAMNqC02dNvlhfKdBXsZhYtvWogO9X+PydQ64vJ136MWjvGRbmRScP6h/ngKbj2t
	7WpryHb7VbQK52QTYu2tNqinFjfxzDmCACzXbIA6hIdyU7ywOfW7FyL8iWvADXFt
	SCPdGUIPhY2UaQ7N9HRdAQskg/EdT0lOb4fMsdPqWcyQEwT+pz5AjkgUPGCIQIHp
	Usk362MEr/1c+f2WbMj9RI2CSAB97P/FNl2esyJ6yBr/JGZdDYboUxgPJ1CkBSzQ
	6ijtNSaUNDVPqK5JbVrqQTxTJ8izpYpKnYg5e4kUV4KZ9w==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyy75uhkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <tools@linux.kernel.org>; Thu, 19 Mar 2026 13:19:11 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-950bdef305cso1345353241.0
        for <tools@linux.kernel.org>; Thu, 19 Mar 2026 06:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773926350; x=1774531150; darn=linux.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jcgutIDYP3LXPrjhG3INGWkLLRobk4AN5uy9lV6AJrk=;
        b=dXrx6KAeP+L+RWKU61H6heaD9paV/AFODhC5Os9QWeZZXbmC8iLv4pZ1Fyar9uEQix
         dR6xt2+Jgw8P/MH8PnZF09V33TTDPULGSJq/TIgX8dL/kutTRIh7E2okv/gzxiYXnNgg
         IvpIlM5LyNvqClolcuxYcG2KWk22qcm/2DGx7uqSRsNr81/PdrPLgj1TyyVfBG4rdu3/
         g54WH0HtR4KD3jz/P/1s/HkCVv0oOH6uMZ5ThRR8TA5Xez6G8y8aS4sUlWnVG939amYi
         jDSHbomznEisqliMAhTyLZ12tls9ei9eA4d3k05HOgIZzOVnwRKkpL6ZC/SZqprWLQID
         ESnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773926350; x=1774531150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jcgutIDYP3LXPrjhG3INGWkLLRobk4AN5uy9lV6AJrk=;
        b=OqHTUJ7XQHqEYfihyyhcjWdCWfzyOz5gDQzdu17quw4EginNxnMcG/FcX9nHCt5d9f
         Ml+1NOhm5ISJJlZXsSVeLi75hrriYOOlT4VxSJuG7STNCX6sdDZck729rS6eeH0pbsKw
         fQzQFoeNmkaKOaLlqtP0njJ8uUpTLL5JdTI/l4/f/kuILhYswBo9g6fWdmgmXtcROxg1
         Xo6k/XIyl+IcbYDnvxW1SDSH5FumvPsL7aVGYjrmpWJBz4eILXwPDKCTrPjbe8w2OJZf
         cWvcVsK4e9oW5rqSurhXN7oD52TqMtpJDfJKGdjyXTRJ2FQ6uA6tVYE4p2Z8tlz2YtFA
         E+Nw==
X-Forwarded-Encrypted: i=1; AJvYcCU6egXX2d1Qu83spCrFLHLJe73PaauGMAeVqO7D0jJQEKOvn7qwNrFUWTZ0JMJqyfr/sYljzw==@linux.kernel.org
X-Gm-Message-State: AOJu0Yx1BEq2rGqK5lgkZWmI+xxmUTJe1ncobkqlmVBKHfRg1D27xrwx
	k7FzYHB6U1QRalHFZj2ERXzbK91YDu8iiq804DztgPYPxueKNWsN1TbGkKQGul6xcUXx6wpz+w/
	lii1Us+Ja5tL+FwEMK9UGbaVfkWzDaIg5i9pOWk69uBD2fw6TxguHqDdhr8g=
X-Gm-Gg: ATEYQzwS59Z1WhREArlKxkfllcW7CuszMGXj4ufUG+9UOBSYLGRC/c6G8GS6m7os/N/
	8lZCV0efTLWqzgmH0K6DdA9H2N0DKdN83Ykcx+u+H5jSaV59VABIQEq/tQO05DHdA+OZni3sXsx
	B/JzBjOQU9XwNsJA2pccrVkKjVpiXlBBjjzEMucTVb47+p0rzHCe41cNC0M4WF2N8Pm685o/CUH
	eVWML+1WLc7MFKPeXrMZVHlCrWctvm7GOJw0phlLdLURmIWvtnI/MwKuU/PmZRoDWyK0yWcK+CR
	GpiqyMxBp9/jBsCxjsz7XkKnC2i9qWZrPit0Egtk0/d1YP2uamTZbhP3gg5KB3IGIEzPusTDRh3
	RUOzJJsj1CRQJorl0igLUcIKcnO4PLEaohA==
X-Received: by 2002:a05:6102:e0e:b0:602:6987:e22f with SMTP id ada2fe7eead31-6027d3f8fcfmr3204785137.33.1773926350240;
        Thu, 19 Mar 2026 06:19:10 -0700 (PDT)
X-Received: by 2002:a05:6102:e0e:b0:602:6987:e22f with SMTP id ada2fe7eead31-6027d3f8fcfmr3204768137.33.1773926349674;
        Thu, 19 Mar 2026 06:19:09 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892273sm13410397f8f.19.2026.03.19.06.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 06:19:08 -0700 (PDT)
Date: Thu, 19 Mar 2026 15:19:06 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, tools@linux.kernel.org
Subject: Re: [PATCH v5 0/2] arm64: dts: qcom: glymur: Add USB support
Message-ID: <aknptlixo2vthjy4dxgfsnmrwxhs5rgc7seqmpkogevfkzzqcx@vwnu53hx5ppk>
References: <20260319-dts-qcom-glymur-add-usb-support-v5-0-b1d9c03d5f09@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-dts-qcom-glymur-add-usb-support-v5-0-b1d9c03d5f09@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDEwMyBTYWx0ZWRfX9nHGt31LubXz
 HiA0RFjzQY8CclFtn5lSSYGtXgImZhkFJBqImGRkVXRDvYCNoozJ+tbMrz1DJFtl/qvhEwDB5HN
 nFdVsjP/WCFY6H7eSM7qzX40iNWx5eWJ4YzI2dVnq5HhryWg4/xR1BHlHKlDyV7PB+QWvDW70IR
 DbjUJ6th7Ua5eNqfK8yBSDeibviwY/mvE+7pj1GOE/6oAvkAxs1BDeSikCne74ppVAyLlJy504t
 Q86LnUvMlfu8JZgWzPT27m/0HaGjwkGpl1PBWa0wgZHj1SdRVGBxdtFKe+SVElp32GzTiM4UywD
 mwvrcfoeGfBsaCoLUPw8r8CvpsFSGmwiJM1QRak5BgOqMSh6MyBdw+RvJJ8iotJixaRjQ73H2C/
 1PrnPLz/o4mHKmy5gMDA3LDVPsNd72mLz8paU9IkpXpv17fvGmfIqw5MjdDnbNmiGnYkDUuzhJ/
 49DvW0RstErn8C9Z0Xw==
X-Proofpoint-ORIG-GUID: wqyChrn6L9E_K4ncD-Ld2e4PGl58oBEm
X-Authority-Analysis: v=2.4 cv=A7hh/qWG c=1 sm=1 tr=0 ts=69bbf7cf cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=8EIStOlnW5gHCOv4-VUA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: wqyChrn6L9E_K4ncD-Ld2e4PGl58oBEm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 bulkscore=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190103

On 26-03-19 14:36:43, Abel Vesa wrote:
> Add support for USB on Glymur SoC and its Compute Reference Device.
> 
> This unblocks the upstreaming of the display support, since 3 DP instances
> rely on some clocks provided by the combo PHYs.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

For some reason, 'b4 trailers -u' didn't pick Dmitry's R-b tags, and I
didn't double check it before respining. Sorry about that.
I can add them and respin if necessary.

It might be because I rebased on new -next and then run the 'b4
trailers -u'. But I'm not sure.

(cc'ed tools mailing list)
