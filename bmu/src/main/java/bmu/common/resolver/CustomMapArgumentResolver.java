package bmu.common.resolver;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import bmu.common.common.CommandMap;

public class CustomMapArgumentResolver implements HandlerMethodArgumentResolver {

	@Override
	//resolverArgument 메서드는 파라미터와 기타 정보를 받아서 실제 객체를 반환함
	public Object resolveArgument(MethodParameter Parameter, ModelAndViewContainer mavContainer, NativeWebRequest webRequest,
			WebDataBinderFactory binderFactory) throws Exception {
		CommandMap commandMap = new CommandMap();
        
        HttpServletRequest request = (HttpServletRequest) webRequest.getNativeRequest();
        Enumeration<?> enumeration = request.getParameterNames();
         
        String key = null;
        String[] values = null;
        while(enumeration.hasMoreElements()){
        		//request에 담겨있는 값을 iterator를 이용하여 하나씩 가져옴
            key = (String) enumeration.nextElement();
            values = request.getParameterValues(key);
            if(values != null){
            	//request에 담겨있는 모든 키(key)와 값(value)을 commandMap에 저장함
               commandMap.put(key, (values.length > 1) ? values:values[0] );               
            }
        }
        return commandMap;
        //모든 파라미터가 담겨있는 commandMap을 반환함
    }	
		
		@Override
		//Resolver가 적용 가능한지 검사하는 역할
	public boolean supportsParameter(MethodParameter Parameter) {
		return CommandMap.class.isAssignableFrom(Parameter.getParameterType());
			
	}
	
}